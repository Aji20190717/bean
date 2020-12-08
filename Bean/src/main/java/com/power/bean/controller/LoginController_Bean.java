package com.power.bean.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.biz.LoginBiz;

@Controller
public class LoginController_Bean {
	
	@Autowired
	private LoginBiz biz;

	// 메인 페이지에서 로그인/회원가입 버튼 누르면 오는 곳
	@RequestMapping("/loginform.do")
	public String loginform() {
		
		return "loginBean";
		
	}
	
	// 로그인/회원가입 페이지에서 회원가입 누르면 강사/수강생 선택 페이지로 감
	@RequestMapping("/registtype.do")
	public String registtype() {
		
		return "registType";
		
	}
	
	// 강사/수강생이 결정되면 값을 가지고 회원가입 폼으로 넘어감.
	@RequestMapping("/registform.do")
	public String registform(String type, HttpSession session) {
		
		session.setAttribute("type", type);
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
			
		return "meailChk";
			
	}
	
	
	
	
	
}
