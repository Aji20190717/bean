package com.power.bean.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;

@Controller
public class LoginController_Bean {

	@Autowired
	private LoginBiz biz;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 메인 페이지에서 로그인/회원가입 버튼 누르면 오는 곳
	@RequestMapping("/loginform.do")
	public String loginform() {

		return "login";

	}

	// 로그인/회원가입 페이지에서 회원가입 누르면 강사/수강생 선택 페이지로 감
	@RequestMapping("/registtype.do")
	public String registtype() {

		return "registType";

	}

	// 강사/수강생이 결정되면 값을 가지고 회원가입 폼으로 넘어감.
	@RequestMapping("/registform.do")
	public String registform(String type, Model model) {

		model.addAttribute("type", type);
		return "registBean";

	}

	// id체크하는 페이지
	@RequestMapping("/idChk.do")
	public String idChkpage(String id, Model model) {

		model.addAttribute("idChk", biz.idChk(id));
		return "idChk";

	}

	// email체크하는 페이지
	@RequestMapping("/emailChk.do")
	public String emailChkpage(String email, Model model) {

		model.addAttribute("emailChk", biz.idChk(email));
		return "emailChk";

	}

	// 회원가입
	@RequestMapping(value = "/resister.do", method = RequestMethod.POST)
	public String register(MultipartHttpServletRequest request, Model model, LoginDto dto,
			@RequestParam("member_mpfile") MultipartFile file, BindingResult result) {

	
		boolean filechk = true;
		if (file.getSize() == 0) {
			filechk = false;
		}

		Date today = new Date();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time1 = new SimpleDateFormat("HH:mm:ss");

		String date2 = date1.format(today).replace("-", "");
		String time2 = time1.format(today).replace(":", "");

		if (filechk) {

			String name = "";
			String oldname = file.getOriginalFilename();
			int index = oldname.lastIndexOf(".");
			
			if (index != -1) {// 파일 확장자 위치
				name = date2 + oldname.substring(0, index) + time2 + 
						oldname.substring(index, oldname.length());// 현재
			}
			dto.setMember_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {

				inputStream = file.getInputStream(); // 파일내용을 읽기 위해 inputstream을 받아옴
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), 
						"/resources/storage");
				
				File storage = new File(path);
				if (!storage.exists()) {
					storage.mkdirs(); 
				}

				File newFile = new File(path + "/" + name);
			
				if (!newFile.exists()) {
					newFile.createNewFile();
				}

				dto.setMember_imgpath(path);

				outputStream = new FileOutputStream(newFile);

				int read = 0;
				// 읽은 데이터 크기
				byte[] b = new byte[(int) file.getSize()];
		
				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}

			} catch (IOException e) {
				e.printStackTrace();
			} finally {

				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		dto.setMember_pwchk(passwordEncoder.encode(dto.getMember_pwchk()));

		int res = biz.resister(dto);

		if (res > 0) {

			return "mainpage";
		}

		return "registBean";

	}

	@RequestMapping("/login.do")
	public String login(HttpSession session, Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String member_id = auth.getName();
		LoginDto res = biz.login(member_id);

		if (res != null) {
			if (res.getMember_withdrawal().equals("N")) {
				session.setAttribute("login", res);
				return "mainpage";
			} else if (res.getMember_withdrawal().equals("Y")) {
				String msg = "탈퇴한 회원입니다.";
				model.addAttribute("msg", msg);
				return "login_withdrawal";
			}
		}

		return "login";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {

		session.invalidate();
		session = request.getSession(true);

		if (session.isNew()) {
			System.out.println("세션만료");
		} else {
			System.out.println("세션 살아있음");
		}

		return "mainpage";

	}

	// error
	@RequestMapping("/error.do")
	public String accessDeniedPage() throws Exception {
		return "login_withdrawal";
	}
}

