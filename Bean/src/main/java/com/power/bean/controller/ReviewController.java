package com.power.bean.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.biz.ReviewBiz;
import com.power.bean.dto.LoginDto;
import com.power.bean.dto.ReviewDto;

@Controller

public class ReviewController {
	
	@Autowired
	private ReviewBiz biz;
	
	@RequestMapping("/review_list.do")
	public String selectList(Model model) {
		System.out.println("list.do");
		model.addAttribute("list",biz.selectList());		
		return "review_list";
	}
	
	@RequestMapping("/review_insertform.do")
	public String review_insertForm(HttpSession session) {
		System.out.println("review_insertform.do");
		
		 
		LoginDto dto=(LoginDto)session.getAttribute("login");
		if(dto == null || dto.getMember_no() == 0) {
			return "redirect:loginform.do";
		}
		return "review_insert";
	}
	
	@RequestMapping("/review_insertres.do")
	public String review_insertRes(ReviewDto dto) {
		System.out.println("review_insertres.do");
		System.out.println(dto.getMember_no());
		int res=biz.review_insert(dto);

		if(res>0) {
			return "redirect:review_list.do";
		}
		
	return "redirect:review_insertform.do";	
	}
	
	@RequestMapping("/review_detail.do")
	public String detail(Model model,int reviewboard_no) {
		System.out.println("review_detail.do");
		
		model.addAttribute("dto",biz.review_selectOne(reviewboard_no));
		return "review_detail";
	}
	
	@RequestMapping("/review_updateform.do")
	public String updateForm(Model model,int reviewboard_no) {
		System.out.println("review_updateform.do");
		
		model.addAttribute("dto",biz.review_selectOne(reviewboard_no));
		
		return "review_update";
	}
	
	@RequestMapping("/review_updateres.do")
	public String updateRes(ReviewDto dto) {
		System.out.println("review_updateres.do");
		
		int res=biz.review_update(dto);
		if(res>0) {
			return "redirect:review_detail.do?reviewboard_no="+dto.getReviewboard_no();
		}
		
		return "redirect:review_updateform.do?reviewboard_no="+dto.getReviewboard_no();
	}
	
	@RequestMapping("/review_delete.do")
	public String delete(int reviewboard_no) {
		System.out.println("review_delete.do");
		
		int res= biz.review_delete(reviewboard_no);
		if(res>0) {
			return "redirect:review_list.do";
		}
		return "redirect:review_delete.do?reviewboard_no="+reviewboard_no;
	}
	
	@RequestMapping("/reviewboard.do")
	public String reviewboard() {
		System.out.println("/reviewboard.do");
		biz.reviewboard();
		return "redirect:review_list.do";
	}	
}
