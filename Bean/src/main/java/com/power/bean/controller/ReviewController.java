package com.power.bean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.power.bean.biz.ReviewBiz;
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
	public String insertForm() {
		System.out.println("insertform.do");
		
		return "reviewinsert";
	}
	
	@RequestMapping("/review_insertres.do")
	public String insertRes(@ModelAttribute ReviewDto dto) {
		System.out.println("review_insertres.do");
		
		int res=biz.insert(dto);
		
		if(res>0) {
			return "redirect:list.do";
		}
		
	return "redirect:review_insertform.do";	
	}
	
	@RequestMapping("/detail.do")
	public String detail(Model model,int reviewboard_no) {
		System.out.println("review_detail.do");
		
		model.addAttribute("dto",biz.selectOne(reviewboard_no));
		return "reviewdetail";
	}
	
	@RequestMapping("/review_updateform.do")
	public String updateForm(Model model,int reviewboard_no) {
		System.out.println("review_updateform.do");
		
		model.addAttribute("dto",biz.selectOne(reviewboard_no));
		
		return "review_reviewupdate";
	}
	
	@RequestMapping("/review_updateres.do")
	public String updateRes(ReviewDto dto) {
		System.out.println("review_updateres.do");
		
		int res=biz.update(dto);
		if(res>0) {
			return "redirect:review_detail.do?reviewboard_no="+dto.getReviewboard_no();
		}
		
		return "redirect:review_updateform.do?reviewboard_no="+dto.getReviewboard_no();
	}
	
	@RequestMapping("/review_delete.do")
	public String delete(int reviewboard_no) {
		System.out.println("review_delete.do");
		
		int res= biz.delete(reviewboard_no);
		if(res>0) {
			return "redirect:review_list.do";
		}
		return "redirect:review_delete.do?reveiwboard_no="+reviewboard_no;
	}
	
	@RequestMapping("/reviewboard.do")
	public String reviewboard() {
		System.out.println("/reviewboard.do");
		biz.reviewboard();
		return "redirect:review_list.do";
	}	
}
