package com.power.bean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.util.TranslateService;

@Controller
public class TranslateController {

	@Autowired
	private TranslateService tservice;

	@RequestMapping("/trans.do")
	public String transform() {

		return "translation";
	}

	@RequestMapping("/transres.do")
	public String trans(Model model, String source, String target, String text) {
		
		model.addAttribute("result", tservice.Translate(source, target, text));
		model.addAttribute("text" , text);

		return "translation";
	}

}
