package com.power.bean.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.power.bean.dto.LoginDto;
@Controller
public class KakaoController {
	
	
	
	
	@RequestMapping(value = "kakaologin.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		JsonNode token = kakaoLogin.getAccessToken(code);
		JsonNode accessToken = token.get("access_token");
		System.out.println(accessToken);
		
		JsonNode profile = kakaoLogin.getKakaoUserInfo(accessToken);
		System.out.println(profile);
		LoginDto dto = kakaoLogin.changeData(profile);
		//dto.setMember_sns("k" + dto.getMember_sns());

		//System.out.println(session);
		//session.setAttribute("login", dto);
		//System.out.println(dto.toString());

	
		return "login/kakaoLogin";
	}
	
	
	
	

}
