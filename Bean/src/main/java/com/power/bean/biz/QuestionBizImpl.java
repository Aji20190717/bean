package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.QuestionDao;
import com.power.bean.dto.PagingDto;
import com.power.bean.dto.QuestionDto;

@Service
public class QuestionBizImpl implements QuestionBiz{
	
	@Autowired
	private QuestionDao questionDao;

	

	@Override
	public List<QuestionDto> selectQuestionList(PagingDto pagingDto) {
		return questionDao.selectQuestionList(pagingDto);
	}

	public QuestionDto selectOneQuestion(int questionboard_no) {
		
		return questionDao.selectOneQuestion(questionboard_no);
	}
	
	public int uploadQuestion(QuestionDto dto) {
		
		return questionDao.uploadQuestion(dto);
	}
	
	public int QuestionReply(QuestionDto dto) {
		
		return questionDao.QuestionReply(dto);
	}
	
	public int QuestionUpdate(QuestionDto dto) {
		
		return questionDao.QuestionUpdate(dto);
	}
	
	public int QuestionDelete(int questionboard_no) {
	
		return questionDao.QuestionDelete(questionboard_no);
		
	}

	public QuestionDto selectOneForReplyOrUpdate(int questionboard_no) {
		
		return questionDao.selectOneForReplyOrUpdate(questionboard_no);
		
	}

	@Override
	public int countBoard() {
		
		return questionDao.countBoard();
	}
	
	

}
