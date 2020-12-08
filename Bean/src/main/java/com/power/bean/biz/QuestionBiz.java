package com.power.bean.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.power.bean.dto.QuestionDto;

@Service
public class QuestionBiz {

	public List<QuestionDto> selectQuestionList(){
		
		
		return null;
	}
	
	public QuestionDto selectOneQuestion(int questionboard_no) {
		
		return null;
	}
	
	public int uploadQuestion(QuestionDto dto) {
		
		return 0;
	}
	
	public int QuestionReply(QuestionDto dto) {
		
		return 0;
	}
	
	public int QuestionUpdate(QuestionDto dto) {
		
		return 0;
	}
	
	public int QuestionDelete(int questionboard_no) {
	
		return 0;
		
	}

}
