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
	
	@RequestMapping("/selectOneClass.do")
	public String selectOneClass(Model model, int class_no) {
		
		ClassDto classDto = classBiz.selectOneClass(class_no);

		//temp data : 사용자 데이터를 보내 줄 것이다
		//아니면 Session 값을 javascript에 바로 넣는 것이 가능하다면 session으로 처리
		String usernum = "" + 3;
		String userName = "user1";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("userName", userName);
		
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		System.out.println(json);
		System.out.println(json.getClass());
		
		String classJson = gson.toJson(classDto);
		System.out.println(classJson);
		
		model.addAttribute("classDto", classJson);
		model.addAttribute("map", json);
		
		
		return "class_paying";
		
	}
	
	// id를 넣으면 결제한 class list를 보내주는 함수
	@RequestMapping("/selectPayingClassList.do")
	public String selectPayingClassList(Model model, int member_no){
		List<ClassDto> payingClassList = classBiz.selectPayingClassList(member_no);
		System.out.println(payingClassList);
		model.addAttribute(payingClassList);
		
		return null;
		
	}
	
	// 학생이 도중에 수강을 포기할 경우 class json String에서 이름을 제거, 환불 처리 진행
	@RequestMapping("/studentRun.do")
	public String studentRun(int class_no, int member_no, String imp_uid) {
		
		//TODO : PayingBiz의 환불 코드
		return null;
		
	}
	
	@RequestMapping("/insertRes.do")
	public String insertRes(int member_no, Model model){
		
		model.addAttribute("member_no", member_no);
		
		return "class_add";
	}
		
	
	@RequestMapping("/insertClass")
	public String insertClass(ClassDto insertDto) {
		
		System.out.println(insertDto);
		
		/*
		try {
			
			//string date를 java.util.Date 값으로 변환
			java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("mm/dd/yyyy");
			java.util.Date class_startDate = dateFormat.parse(from);
			java.util.Date class_endDate = dateFormat.parse(to);
			
			
			insertDto.setClass_startDate(class_startDate);
			insertDto.setClass_endDate(class_endDate);
			
			System.out.println(insertDto);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		*/

		
		
		int res = classBiz.insertClass(insertDto);
		if(res>0) {
			
			return "redirect:mypagedetail.do?member_no=" + insertDto.getMember_no();
		}
		return null;
		
	}
	

}
