package com.power.bean.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.power.bean.biz.ClassBiz;
import com.power.bean.biz.LoginBiz;
import com.power.bean.biz.MemberBiz;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;

@Controller
public class MemberController {
// 개인정보 수정. 탈퇴. 조회. 프로필 사진 로딩 기능

	@Autowired
	private ClassBiz classbiz;
	
	@Autowired
	private MemberBiz biz;

	@Autowired
	private LoginBiz loginbiz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 마이페이지 첫 화면 : 로그인 후 이름 누르면 나오는 곳 (수강생)
	@RequestMapping("/myinfo.do")
	public String mypage_su_profile() {
		
		return "mypage_su_profile";

	}
	
	// 프로필 화면의 사진을 로딩하는 컨트롤러
	@RequestMapping("/profileimg.do")
	public String displayPhoto (HttpServletResponse response, Model model, HttpSession session) throws Exception {

	    ServletOutputStream bout = response.getOutputStream();
	    
	    LoginDto dto = (LoginDto) session.getAttribute("login");
		// System.out.println(dto.getMember_no());

		// System.out.println(session.getAttribute("login"));

		String imgpath = dto.getMember_imgpath() + "\\" + dto.getMember_imgname();
		
		int index = dto.getMember_imgname().lastIndexOf(".");
		String file = dto.getMember_imgname().substring(index, dto.getMember_imgname().length());
		// System.out.println(file);
		
		if(file.equals(".jpg")) {
			response.setContentType("image/jpg");
		} else if(file.equals(".png")) {
			response.setContentType("image/png");
		}

	    //파일의 경로
	    FileInputStream f;
	    int length;
	    byte[] buffer = new byte[10];
		try {
			f = new FileInputStream(imgpath);
		    while((length=f.read(buffer)) != -1){
		    	bout.write(buffer,0,length);
		    }
		} catch (FileNotFoundException e) {
			// e.printStackTrace();
			model.addAttribute("img", null);
			// System.out.println("error catch : 파일없음");
		}
	    
	    return null;
	}

	// 마이페이지 첫 화면 : 로그인 후 이름 누르면 나오는 곳 (강사)
	@RequestMapping("/mypage.do")
	public String mypage_te_profile(Model model, HttpSession session) {

		return "mypage_te_profile";

	}

	// 개인정보 조회 : 수강생
	@RequestMapping("/myinfodetail.do")
	public String mypage_su_detail(Model model, int member_no) {
		
		List<ClassDto> classList = classbiz.selectPayingClassList(member_no);
		model.addAttribute("classList", classList);
		
		return "mypage_su_detail";

	}

	// 개인정보 조회 : 강사
	@RequestMapping("/mypagedetail.do")
	public String mypage_te_detail(Model model, int member_no) {
	
		List<ClassDto> ClassList = classbiz.selectTrainerClass(member_no);
		model.addAttribute("classList", ClassList);

		return "mypage_te_detail";

	}

	// 개인정보 수정폼 : 수강생
	@RequestMapping("/myinfoupdateform.do")
	public String mypageupdateform() {

		return "mypage_su_update";

	}

	// 개인정보 수정폼 : 수강생
	@RequestMapping("/mypageupdateform.do")
	public String mypage_te_update() {

		return "mypage_te_update";

	}

	// 개인정보 수정 : 수강생 (비밀번호, 연락처, 주소, 생일, 프로필)
	@RequestMapping(value = "/myinfoupdate.do", method = RequestMethod.POST)
	public String mypageupdate(MultipartHttpServletRequest request, Model model, LoginDto dto,
			@RequestParam("member_mpfile") MultipartFile file, BindingResult result, HttpSession session) {

		// dto.setMember_mpfile(file);
		// System.out.println("id : " + dto.getMember_id());

		// FileValidator fileValidator = new FileValidator();
		boolean filechk = true;

		// fileValidator.validate(file, result);
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
				name = date2 + oldname.substring(0, index) + time2
						+ oldname.substring(index, oldname.length());// 현재 시간과 확장자
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
				// System.out.println(newFile);
				// 해당 경로에 파일이 없을 경우 파일을 새로 생성
				if (!newFile.exists()) {
					newFile.createNewFile();
				}

				dto.setMember_imgpath(path);

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
		
		//pw 인코딩하는 부분
		// System.out.println("암호화 전 : " + dto.getMember_pw());
			
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		dto.setMember_pwchk(passwordEncoder.encode(dto.getMember_pwchk()));
				
		// System.out.println("암호화 후 : " + dto.getMember_pw());

		int res = biz.myinfoupdate(dto);
		System.out.println(res);

		if (res > 0) {

			session.removeAttribute("login");

			LoginDto login = new LoginDto();
			LoginDto info = new LoginDto();
			info.setMember_id(dto.getMember_id());
			// info.setMember_pw(dto.getMember_pw());
			login = loginbiz.login(info.getMember_id());

			session.setAttribute("login", login);
			return "redirect:myinfodetail.do";

		}

		return "redirect:myinfoupdateform.do";

	}

	// 개인정보 수정 : 탈퇴
	@RequestMapping("/myinfodelete.do")
	public String mypagedelete(HttpSession session, String member_no) {

		int res = biz.withdrawal(Integer.parseInt(member_no));

		if (res > 0) {
			session.invalidate();
			return "mainpage";
		}

		return "redirect:myinfodetail.do";

	}

}
