package com.power.bean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.biz.ClassBiz;
import com.power.bean.dto.ClassDto;

@Controller
public class ClassController {
	
	@Autowired
	private ClassBiz classBiz;
	
	@RequestMapping("/classList.do")
	public String selectClassList(Model model){
		
		List<ClassDto> classList = classBiz.selectClassList();
		model.addAttribute("classList", classList);
		
		return "class_list";
	}
	
	@RequestMapping("/selectTrainerClass.do")
	public String selectOneClass(Model model, int class_no) {
		
		ClassDto classDto = classBiz.selectOneClass(class_no);
		model.addAttribute("classDto", class_no);
		
		return "class_paying";
		
	}

}
