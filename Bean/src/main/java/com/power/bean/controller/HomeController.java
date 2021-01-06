package com.power.bean.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/main.do")
	public String mainPage() {

		return "mainpage";
	}

	@RequestMapping("/intro.do")
	public String map() {

		return "bean_intro";
	}

	// 인서트 실험
	@RequestMapping("/test.do")
	public String test() {

		return "testinsert";
	}

}
