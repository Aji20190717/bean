package com.power.bean.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.power.bean.biz.CsBiz;
import com.power.bean.dto.CsDto;
import com.power.bean.util.EchoHandler;

@Controller
public class ChatController {

	@Autowired
	private CsBiz ciz;

	private EchoHandler echo;

	// 채팅방 입장
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model, CsDto dto)
			throws Exception {

		System.out.println("controller dto : " + dto.getCsname());

		return "cs_chat";
	}

	@RequestMapping("/cslist.do")
	public String cs_List(Model model) {

		model.addAttribute("list", ciz.selectList());

		return "cs_list";

	}

	@RequestMapping("/csdetail.do")
	public String cs_detail(int csno, Model model) {

		model.addAttribute("csdto", ciz.selectOne(csno));

		return "cs_detail";
	}

	@RequestMapping("/csinsertform.do")
	public String cs_insertForm(Model model, CsDto dto) {

		if (dto.getCsname().equals("")) {

			return "login";
		}

		return "cs_insert";
	}

	@RequestMapping("/csinsertres.do")
	public String cs_insertRes(Model model, CsDto dto) {

		int res = ciz.insert(dto);

		if (res > 0) {

			return "redirect:cslist.do";
		}
		return "redirect:csinsertform.do";
	}

	@RequestMapping("/csupdateform.do")
	public String updateForm(int csno, Model model) {

		model.addAttribute("dto", ciz.selectOne(csno));

		return "cs_update";
	}

	@RequestMapping("/csupdateres.do")
	public String updateRes(CsDto dto) {

		int res = ciz.update(dto);

		if (res > 0) {
			return "redirect:csdetail.do?csno=" + dto.getCsno();
		}

		return "redirect:csupdateform.do?csno=" + dto.getCsno();
	}

	@RequestMapping("/csdelete.do")
	public String delete(int csno) {

		int res = ciz.delete(csno);

		if (res > 0) {
			return "redirect:cslist.do";
		} else {
			return "redirect:csdetail.do?csno=" + csno;
		}

	}

}
