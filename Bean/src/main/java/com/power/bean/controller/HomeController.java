package com.power.bean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
