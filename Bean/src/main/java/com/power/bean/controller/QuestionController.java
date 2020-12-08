package com.power.bean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.biz.QuestionBiz;
import com.power.bean.dto.QuestionDto;

@Controller
public class QuestionController {
	
	
	@Autowired
	private QuestionBiz questionBiz;
	
	@RequestMapping("/questionList.do")
	public String questionList(Model model) {
		
		System.out.println("questionList.do");
		
		List<QuestionDto> list = biz.selectQuestionList();
		
		
		
		
		return "question_list";
		
	}
	
	@RequestMapping("/questionDetail.do")
	public String questionDetail(Model model, int questionNum) {
		
		return "question_detail";
		
	}
	
	@RequestMapping("/questionReply.do")
	public String questionReply(Model model, int questionNum) {
	
		
		return "question_reply";
	}
	
	@RequestMapping("/questionUploadres.do")
	public String questionUpdateRes() {
		
		return "question_update";
	}
	
	@RequestMapping("/questionUpload.do")
	public String questionUpdate(Model model, QuestionDto dto) {
		
		return null;
	}
	
	
	
	
	
	
	

}
