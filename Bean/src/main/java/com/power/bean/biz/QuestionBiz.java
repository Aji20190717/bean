package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.QuestionDto;

public interface QuestionBiz {
	
	public List<QuestionDto> selectQuestionList();
	public QuestionDto selectOneQuestion(int questionboard_no);
	public QuestionDto selectOneForReplyOrUpdate(int questionboard_no);
	public int uploadQuestion(QuestionDto dto);
	public int QuestionReply(QuestionDto dto);
	public int QuestionUpdate(QuestionDto dto);
	public int QuestionDelete(int questionboard_no);
	
}
