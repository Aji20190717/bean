package com.power.bean.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.power.bean.biz.ClassBiz;
import com.power.bean.biz.MemberBiz;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;
import com.power.bean.dto.PagingDto;

@Controller
public class ClassController {
	

	@Autowired
	private ClassBiz classBiz;
	
	@Autowired
	private MemberBiz memberBiz;

	@RequestMapping("/classList.do")
	public String selectClassList(Model model, PagingDto pagingDto, String nowPage, String cntPerPage) {

		int classCount = classBiz.countClass();
		
		// pagingination
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {

			nowPage = "1";

		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		pagingDto = new PagingDto(classCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<ClassDto> classList = classBiz.selectClassList(pagingDto);
		List<LoginDto> trainerList = memberBiz.selectTrainer();
		
		model.addAttribute("classList", classList);
		model.addAttribute("trainerList", trainerList);
		model.addAttribute("classCount", classCount);
		model.addAttribute("paging", pagingDto);
		

		return "class_list";
	}

	@RequestMapping("/selectOneClass.do")
	public String selectOneClass(Model model, int class_no, HttpSession session) {

		ClassDto classDto = classBiz.selectOneClass(class_no);
		LoginDto trainerDto = memberBiz.selectOneMember(classDto.getMember_no());
		
		Gson gson = new GsonBuilder().create();
		Map<String, Object> map = new HashMap<String, Object>();
		LoginDto loginDto = (LoginDto) session.getAttribute("login");
		String json = "";

		if (loginDto != null) {

			String usernum = "" + loginDto.getMember_no();
			String userName = loginDto.getMember_name();

			map.put("usernum", usernum);
			map.put("userName", userName);
			map.put("value", "true");

			 json = gson.toJson(map);

			model.addAttribute("json", json);
			
		}else {
			
			map.put("value", "false");
			json = gson.toJson(map);
			
		}

		String classJson = gson.toJson(classDto);
         
		model.addAttribute("json", json);
		model.addAttribute("classJson", classJson);
		model.addAttribute("classDto", classDto);
		model.addAttribute("trainerDto", trainerDto);
		
		return "class_paying";

	}

	// id를 넣으면 결제한 class list를 보내주는 함수
	@RequestMapping("/selectPayingClassList.do")
	public String selectPayingClassList(Model model, int member_no) {
		List<ClassDto> payingClassList = classBiz.selectPayingClassList(member_no);
		System.out.println(payingClassList);
		model.addAttribute(payingClassList);

		return null;

	}

	// 학생이 도중에 수강을 포기할 경우 class json String에서 이름을 제거, 환불 처리 진행
	@RequestMapping("/studentRun.do")
	public String studentRun(int class_no, int member_no) {

		// TODO : PayingBiz의 환불 코드
		int res = classBiz.StudentRun(class_no, member_no);
		System.out.println(res);

		if (res > 0) {
			return "redirect:myinfodetail.do?member_no=" + member_no;
		}

		return null;

	}

	@RequestMapping("/insertRes.do")
	public String insertRes(Model model) {

		return "class_add";
	}

	@RequestMapping("/insertClass.do")
	public String insertClass(ClassDto insertDto , HttpSession session) {
	
		LoginDto loginDto = (LoginDto) session.getAttribute("login");
		
		int res = classBiz.insertClass(insertDto);
		if (res > 0) {

			return "redirect:mypagedetail.do?member_no=" + loginDto.getMember_no();
		}
		return "redirect:insertRes.do";

	}
	
	@RequestMapping("/mailTemp.do")
	public String mailTemp() {
		
		
		return "mailTemp";
		
	}
	

}