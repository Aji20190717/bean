package com.power.bean.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.power.bean.biz.LoginBiz;
import com.power.bean.dto.LoginDto;
@Controller
public class KakaoController {
	
	
	@Autowired
	private LoginBiz biz;
	
	//jsp에서 버튼을 클릭하면 kakaologin.do가 실행될거에요
	@RequestMapping(value = "kakaologin.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		JsonNode token = kakaoLogin.getAccessToken(code);
		System.out.println("토큰 :    "+token);
		//사용자의 정보가 들어있어요(토큰)
		JsonNode accessToken = token.get("access_token");
		System.out.println(accessToken);
		
		JsonNode profile = kakaoLogin.getKakaoUserInfo(accessToken);
		System.out.println(profile);
		LoginDto dto = kakaoLogin.changeData(profile);
		dto.setMember_id(dto.getMember_id());
		dto.setMember_name(dto.getMember_name());
		dto.setMember_email(dto.getMember_email());
		dto.setMember_sns(dto.getMember_sns());
		
		
		int res= biz.kakaoInsert(dto);
		if(res>0) {
			System.out.println("db저장");
			return "mainpage";
		}
		
		return "login/kakaoLogin";
	}
	
	
	
	
	

}
