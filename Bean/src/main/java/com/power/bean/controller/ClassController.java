package com.power.bean.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
		model.addAttribute("classDto", classDto);
		

		//temp data : 사용자 데이터를 보내 줄 것이다
		//아니면 Session 값을 javascript에 바로 넣는 것이 가능하다면 session으로 처리
		String usernum = "" + 1;
		String userName = "djdh";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("userName", userName);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		System.out.println(json);
		System.out.println(json.getClass());
		
		model.addAttribute("map", json);
		
		//model.addAttribute("map", map);
		
		
		
		return "class_paying";
		
	}

}
