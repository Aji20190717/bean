package com.power.bean.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;

@Controller
public class LoginController_Naver {
	
	@Autowired
	private LoginBiz biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 네이버로 로그인하면 네이버에서 콜백해주는 페이지
	@RequestMapping("/navercallback.do")
	public String navercallback() {

		return "navercallback";

	}
	
	
	
	// 네이버 로그인 완료 후 정보 받아서 처리할 페이지
	@RequestMapping(value = "/naverlogin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> naverlogin(@RequestBody LoginDto dto , HttpSession session) {

		System.out.println("member_sns1 : " + dto.getMember_sns());
		System.out.println("member_name : " + dto.getMember_name());
		System.out.println("member_email : " + dto.getMember_email());
		
		String member_sns = "naver" + dto.getMember_sns();
		
		LoginDto res = biz.snsChk(member_sns);
		boolean check = false;		
		
		if (res != null) {
			
			session.setAttribute("login", res);
			check = true;
			
		} else {
			
			LoginDto add = new LoginDto();
			add.setMember_sns(member_sns);
			add.setMember_email(dto.getMember_email());
			add.setMember_name(dto.getMember_name());
			
			session.setAttribute("info", add);
			
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
		
	}
	
	// 네이버 아이디로 가입하기
	@RequestMapping("/naverform.do")
	public String naverform() {

		return "registNaver";

	}
	
	// 네이버 정보 + 개인정보로 가입폼 작성 완료하면 실제 insert
	@RequestMapping(value = "/naverResister.do", method=RequestMethod.POST)
	public String naverResister(MultipartHttpServletRequest request, Model model,
			LoginDto dto, @RequestParam("member_mpfile") MultipartFile file, BindingResult result, HttpSession session) {

		// dto.setMember_mpfile(file);
		dto.setMember_type("SN");
		// System.out.println("file : " + file);
		
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
			
			if(index != -1) {//파일 확장자 위치 
				name = date2 + oldname.substring(0, index) + time2 + oldname.substring(index, oldname.length()) ;// 현재 시간과 확장자
			}
			//String name = date.format(today) + file.getOriginalFilename() + time.format(today);

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

				// newFile에 쓰기 위한 outputstream
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				// 읽은 데이터 크기
				byte[] b = new byte[(int) file.getSize()];
				// int로 변환한 file의 크기만큼씩 끊어서 읽기

				// inputStream.read(bytes) : bytes의 배열크기 만큼씩 읽어서 bytes배열에 저장 (읽은 데이터는 inputSream에서 사라짐)
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
		
		// dto.setMember_sns("naver" + dto.getMember_sns());
		//pw 인코딩하는 부분
		// System.out.println("암호화 전 : " + dto.getMember_pw());
					
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		dto.setMember_pwchk(passwordEncoder.encode(dto.getMember_pwchk()));
						
		// System.out.println("암호화 후 : " + dto.getMember_pw());
		
		int res = biz.resister(dto);

		if(res>0) {
			
			session.invalidate();
			return "mainpage";

		}
		
		return "registNaver";

	}
	


}
