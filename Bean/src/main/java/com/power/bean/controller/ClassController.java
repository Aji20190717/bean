package com.power.bean.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.power.bean.biz.ClassBiz;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;

@Controller
public class ClassController {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private ClassBiz classBiz;

	@RequestMapping("/classList.do")
	public String selectClassList(Model model) {

		List<ClassDto> classList = classBiz.selectClassList();
		model.addAttribute("classList", classList);

		return "class_list";
	}

	@RequestMapping("/selectOneClass.do")
	public String selectOneClass(Model model, int class_no, HttpSession session) {

		ClassDto classDto = classBiz.selectOneClass(class_no);
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
	public String insertRes(int member_no, Model model) {

		model.addAttribute("member_no", member_no);

		return "class_add";
	}

	@RequestMapping("/insertClass")
	public String insertClass(ClassDto insertDto, String email) {
		

		int res = classBiz.insertClass(insertDto);
		if (res > 0) {

			return "redirect:mypagedetail.do?member_no=" + insertDto.getMember_no();
		}
		return "redirect:insertRes.do";

	}
	
	@RequestMapping("/mailTemp.do")
	public String mailTemp() {
		
		
		return "mailTemp";
		
	}
	

}