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
import com.power.bean.util.KakaoLogin;

@Controller
public class LoginController_Kakao {
	
	@Autowired
	private LoginBiz biz;
	
	@RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println("111111111111111  profile : "+profile);
		LoginDto dto = KakaoLogin.changeData(profile);
		
		dto.setMember_id(dto.getMember_id());
		dto.setMember_name(dto.getMember_name());
		dto.setMember_email(dto.getMember_email());
		dto.setMember_sns(dto.getMember_sns());
		
		System.out.println("dto.getMember_id() : "+dto.getMember_id());
		System.out.println("dto.getMember_name() : "+dto.getMember_name());
		System.out.println("dto.getMember_email() : "+dto.getMember_email());
		System.out.println("dto.getMember_sns() : " +dto.getMember_sns());
		
		/*

		dto.setUser_snsId("k" + dto.getUser_snsId());

		System.out.println(session);
		session.setAttribute("login", dto);
		System.out.println(dto.toString());

		dto = service.kakaoLogin(dto);	
		*/
		
		return "login/kakaoLogin";
	
	}
	
	@RequestMapping(value="/kakaoResister.do", method=RequestMethod.POST)
	public String kakaoResister(MultipartHttpServletRequest request, Model model,
			LoginDto dto, @RequestParam("member_mpfile") MultipartFile file, BindingResult result, HttpSession session) {
		
		//dto.setMember
		dto.setMember_type("SG");
		boolean filechk=true;
		
		if(file.getSize()==0) {
			filechk = false;
		}
		
		Date today=new Date();
		SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time1=new SimpleDateFormat("HH:mm:ss");
		
		String date2=date1.format(today).replace("-", "");
		String time2=time1.format(today).replace(":", "");
		
		if(filechk) {
			
			String name="";
			//예전이름...?은 원래이름?
			String oldname=file.getOriginalFilename();
			
			int index=oldname.lastIndexOf(".");
			
			
			if(index != -1) {	//파일 확장자 위치.
				name=date2+oldname.substring(0, index)+time2+oldname.substring(index,oldname.length());		//현재 시간과 확장자
			}
			dto.setMember_imgname(name);
			
			InputStream inputStream=null;
			OutputStream outputStream=null;
			
			try {
				
				inputStream=file.getInputStream();
				String path=WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
				
				File storage=new File(path);
				if(!storage.exists()) {
					storage.mkdirs();
				}
				File newFile=new File(path+"/"+name);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}
				dto.setMember_imgpath(path);
				
				outputStream=new FileOutputStream(newFile);
				
				int read=0;
				
				byte[] b=new byte[(int) file.getSize()];
				
				while((read=inputStream.read(b))!= -1) {
					outputStream.write(b,0,read);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					inputStream.close();
					outputStream.close();
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}			
			
		}
		dto.setMember_sns("kakao"+ dto.getMember_sns());
		
		int res = biz.resister(dto);
		
		if (res>0) {
			session.invalidate();
			return "mainpage";
		}
		
		
		return "registKakao";
	}
		
		
	
	
	
	
}
