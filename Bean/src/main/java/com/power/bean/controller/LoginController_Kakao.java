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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;
import com.power.bean.util.KakaoLogin;

@Controller
public class LoginController_Kakao {

	@Autowired
	private LoginBiz biz;

	@RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println("111111111111111  profile : " + profile);
		LoginDto dto = KakaoLogin.changeData(profile);

		dto.setMember_name(dto.getMember_name());
		dto.setMember_email(dto.getMember_email());
		dto.setMember_sns(dto.getMember_sns());
		

		System.out.println("dto.getMember_name() : " + dto.getMember_name());
		System.out.println("dto.getMember_email() : " + dto.getMember_email());
		System.out.println("dto.getMember_sns() : " + dto.getMember_sns());

		// 셀렉트하기
		// loginDto=res로 만들어서
		LoginDto res = new LoginDto();
		// 결과값이 나올건데
		res = biz.snsChk("kakao"+dto.getMember_sns());
		
		System.out.println("res   ::   "+res);
		System.out.println(res.getMember_no());

		if (res != null) {
			// res가 널이 아니라는건 값이 있다는거고 그럼 로그인이 됐다는 뜻이죠!
			// 세션에 담아서 인덱스 페이지로 갑시다
			session.setAttribute("login", res);
			return "mainpage";

		} else {
			// 아니면 회원가입 페이지로 이동해야되요 그거슨 registKakao이죠
			LoginDto add = new LoginDto();
			add.setMember_sns(dto.getMember_sns());
			add.setMember_email(dto.getMember_email());
			add.setMember_name(dto.getMember_name());
			session.setAttribute("info", add);

			return "registKakao";
		}

		/*
		 * 
		 * dto.setUser_snsId("k" + dto.getUser_snsId());
		 * 
		 * System.out.println(session); session.setAttribute("login", dto);
		 * System.out.println(dto.toString());
		 * 
		 * dto = service.kakaoLogin(dto);
		 */

	}

	// 카카오 정보 + 개인정보 가입폼 작성 완료하면 실제 insert
	@RequestMapping(value = "/kakaoResister.do", method = RequestMethod.POST)
	public String kakaoResister(MultipartHttpServletRequest request, Model model, LoginDto dto,
			@RequestParam("member_mpfile") MultipartFile file, BindingResult result, HttpSession session) {

		// dto.setMember
		dto.setMember_type("SG");
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
			// 예전이름...?은 원래이름?
			String oldname = file.getOriginalFilename();

			int index = oldname.lastIndexOf(".");

			if (index != -1) { // 파일 확장자 위치.
				name = date2 + oldname.substring(0, index) + time2 + oldname.substring(index, oldname.length()); // 현재
																													// 시간과
																													// 확장자
			}
			dto.setMember_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			// sns값을 처리해주세요
			try {

				inputStream = file.getInputStream();
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

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

				byte[] b = new byte[(int) file.getSize()];

				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}

			} catch (Exception e) {
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
		dto.setMember_sns("kakao" + dto.getMember_sns());

		int res = biz.resister(dto);

		if (res > 0) {
			session.invalidate();
			return "mainpage";
		}

		return "registKakao";
	}

}
