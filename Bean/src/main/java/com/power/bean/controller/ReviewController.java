package com.power.bean.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.power.bean.biz.ClassBiz;
import com.power.bean.biz.MemberBiz;
import com.power.bean.biz.ReviewBiz;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;
import com.power.bean.dto.PagingDto;
import com.power.bean.dto.ReviewDto;

@Controller

public class ReviewController {

	@Autowired
	private ReviewBiz biz;

	@Autowired
	private ClassBiz classBiz;

	@Autowired
	private MemberBiz memberBiz;

	@RequestMapping("/review_list.do")
	public String selectList(Model model, PagingDto dto,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String searchType,
			String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		Gson gson = new GsonBuilder().create();
		String searchjson;
		
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		searchjson = gson.toJson(map);

		int total = 0;

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
				total = biz.countSearchCount(searchType, keyword);
		dto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	
		
		model.addAttribute("paging", dto);
		model.addAttribute("list", biz.selectPagingReview(dto, searchType, keyword));
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchjson", searchjson);

		return "review_list";
	}

	@RequestMapping("/review_insertform.do")
	public String review_insertForm(HttpSession session, Model model) {

		LoginDto loginDto = (LoginDto) session.getAttribute("login");

		List<ClassDto> classList = classBiz.selectPayingClassList(loginDto.getMember_no());

		model.addAttribute("classList", classList);

		return "review_insert";
	}

	@RequestMapping("/review_insertres.do")
	public String review_insertRes(ReviewDto dto, int class_no) {

		ClassDto classDto = classBiz.selectOneClass(class_no);

		LoginDto trainerDto = memberBiz.selectOneMember(classDto.getMember_no());
		String trainerName = trainerDto.getMember_name();
		dto.setReviewboard_te(trainerName);

		int res = biz.review_insert(dto);

		if (res > 0) {
			return "redirect:review_list.do";
		}

		return "redirect:review_insertform.do";
	}

	@RequestMapping("/review_detail.do")
	public String detail(Model model, int reviewboard_no) {

		model.addAttribute("dto", biz.review_selectOne(reviewboard_no));

		return "review_detail";
	}

	@RequestMapping("/review_updateform.do")
	public String updateForm(Model model, int reviewboard_no) {

		model.addAttribute("dto", biz.review_selectOne(reviewboard_no));

		return "review_update";
	}

	@RequestMapping("/review_updateres.do")
	public String updateRes(ReviewDto dto) {
		System.out.println("review_updateres.do");

		int res = biz.review_update(dto);
		if (res > 0) {
			return "redirect:review_detail.do?reviewboard_no=" + dto.getReviewboard_no();
		}

		return "redirect:review_updateform.do?reviewboard_no=" + dto.getReviewboard_no();
	}

	@RequestMapping("/review_delete.do")
	public String delete(int reviewboard_no) {
		System.out.println("review_delete.do");

		int res = biz.review_delete(reviewboard_no);
		if (res > 0) {
			return "redirect:review_list.do";
		}
		return "redirect:review_delete.do?reviewboard_no=" + reviewboard_no;
	}

	@RequestMapping("/reviewboard.do")
	public String reviewboard() {

		biz.reviewboard();

		return "redirect:review_list.do";
	}

}