  
package com.power.bean.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;
import com.power.bean.util.FileValidator;

@Controller
public class LoginController_Bean {

	@Autowired
	private LoginBiz biz;

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

		// dto.setMember_mpfile(file);
		// System.out.println("file : " + file);

		// FileValidator fileValidator = new FileValidator();
		boolean filechk = true;

		// fileValidator.validate(file, result);
		/*
		 * if(dto.getMember_mpfile().getSize() == 0) { filechk = false; }
		 */

		if (file.getSize() == 0) {
			filechk = false;
		}

		// System.out.println("filechk : " + filechk);

		Date today = new Date();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time1 = new SimpleDateFormat("HH:mm:ss");

		String date2 = date1.format(today).replace("-", "");
		String time2 = time1.format(today).replace(":", "");
		// System.out.println("time2 : " + time2);

		// file이 있으면
		if (filechk) {

			// int i = -1;
			String name = "";

			String oldname = file.getOriginalFilename();

			int index = oldname.lastIndexOf(".");
			// System.out.println(index);
			// System.out.println(oldname.substring(0, index));

			if (index != -1) {// 파일 확장자 위치
				name = date2 + oldname.substring(0, index) + time2 + oldname.substring(index, oldname.length());// 현재
																												// 시간과
																												// 확장자
			}
			// String name = date.format(today) + file.getOriginalFilename() +
			// time.format(today);

			dto.setMember_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {

				inputStream = file.getInputStream(); // 파일내용을 읽기 위해 inputstream을 받아옴
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
				// SpringMVC. 요청에 딸려오는 값들을 처리할 때 유용한 ServletRequestUtils 와 더불어 유용한 클래스.
				// WebUtils 클래스를 사용하면 Session에 담겨있는 객체들을 보다 짧은 코드로 넣고 빼고 할 수 있으며
				// 세션 객체나 쿠키 객체를 받아올 수 있다.
				// ????????????????????????
				// WebUtils 의 getRealPath 경로가 없으면 FileNotFoundException 발생.
				// /가 없으면 자동으로 붙여준다.

				// System.out.println("업로드 될 실제 이름(real name) : " + name);
				// System.out.println("업로드 될 실제 경로(real path) : " + path);
				// tomcat server의 path가 real path.
				// tomcat server의 path는 현재 tomcat의 실행 위치를 알려주는 것

				File storage = new File(path);
				if (!storage.exists()) {
					// mkdirs : 경로가 없으면 만들어줌
					storage.mkdirs(); // mkdir : 있는 경로만 찾아줌. 없으면 안 만들어준다.
				}

				File newFile = new File(path + "/" + name);
				System.out.println(newFile);
				// 해당 경로에 파일이 없을 경우 파일을 새로 생성
				if (!newFile.exists()) {
					newFile.createNewFile();
				}

				dto.setMember_imgpath(path);
				System.out.println(dto.getMember_imgname());
				System.out.println(dto.getMember_imgpath());

				// newFile에 쓰기 위한 outputstream
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				// 읽은 데이터 크기
				byte[] b = new byte[(int) file.getSize()];
				// int로 변환한 file의 크기만큼씩 끊어서 읽기

				// inputStream.read(bytes) : bytes의 배열크기 만큼씩 읽어서 bytes배열에 저장 (읽은 데이터는
				// inputSream에서 사라짐)
				// read : inputStream이 읽은 데이터의 크기
				while ((read = inputStream.read(b)) != -1) {
					// bytes 배열에 저장된 데이터를 0에서 read크기 까지 outputStream에 쓰기
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

		int res = biz.resister(dto);

		if (res > 0) {

			return "mainpage";
		}

		return "registBean";

	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(LoginDto dto, HttpSession session, Model model) {

		LoginDto res = biz.login(dto);

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
	public String logout(HttpSession session) {

		session.invalidate();
		return "mainpage";

	}

	

}	