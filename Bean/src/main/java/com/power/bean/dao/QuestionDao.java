package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.PagingDto;
import com.power.bean.dto.QuestionDto;

public interface QuestionDao {

	String QUESTIONNAMSESPACE = "question.";
	
	public List<QuestionDto> selectQuestionList(PagingDto pagingDto);
	public QuestionDto selectOneQuestion(int questionboard_no);
	public QuestionDto selectOneForReplyOrUpdate(int questionboard_no);
	public int uploadQuestion(QuestionDto dto);
	public int QuestionReply(QuestionDto dto);
	public int QuestionUpdate(QuestionDto dto);
	public int QuestionDelete(int questionboard_no);
	public int countBoard();
}
