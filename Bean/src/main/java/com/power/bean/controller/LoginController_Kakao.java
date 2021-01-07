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

import com.fasterxml.jackson.databind.JsonNode;
import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;
import com.power.bean.util.KakaoLogin;

@Controller
public class LoginController_Kakao {

	@Autowired
	private LoginBiz biz;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		LoginDto add =null;
		
		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		LoginDto dto = KakaoLogin.changeData(profile);

		dto.setMember_name(dto.getMember_name());
		dto.setMember_email(dto.getMember_email());
		dto.setMember_sns(dto.getMember_sns());

		LoginDto res = new LoginDto();
		res = biz.snsChk("kakao" + dto.getMember_sns());

		if (res != null) {
			session.setAttribute("login", res);
			return "mainpage";

		}
		
		add = new LoginDto();
	
		add.setMember_sns(dto.getMember_sns());
		add.setMember_email(dto.getMember_email());
		add.setMember_name(dto.getMember_name());
		session.setAttribute("info", add);

		return "registKakao";
		
	}

	// 카카오 정보 + 개인정보 가입폼 작성 완료하면 실제 insert
	@RequestMapping(value = "/kakaoResister.do", method = RequestMethod.POST)
	public String kakaoResister(MultipartHttpServletRequest request, Model model, LoginDto dto,
			@RequestParam("member_mpfile") MultipartFile file, BindingResult result, HttpSession session) {

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
			String oldname = file.getOriginalFilename();

			int index = oldname.lastIndexOf(".");

			if (index != -1) {
				name = date2 + oldname.substring(0, index) + time2 + oldname.substring(index, oldname.length()); 
			}
			dto.setMember_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

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
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		dto.setMember_pwchk(passwordEncoder.encode(dto.getMember_pwchk()));

		int res = biz.resister(dto);

		if (res > 0) {
			session.invalidate();
			return "mainpage";
		}

		return "registKakao";
	}

}
