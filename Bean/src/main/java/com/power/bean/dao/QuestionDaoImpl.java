package com.power.bean.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.PagingDto;
import com.power.bean.dto.QuestionDto;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<QuestionDto> selectQuestionList(PagingDto pagingDto) {
		
		List<QuestionDto> PagingQuestionDtoList = sqlSession.selectList(QUESTIONNAMSESPACE + "selectPagingList", pagingDto);
		
		return PagingQuestionDtoList;
	}

	public QuestionDto selectOneQuestion(int questionboard_no) {
		
		//조회수 처리
		sqlSession.update(QUESTIONNAMSESPACE + "questionReadCount", questionboard_no);
		QuestionDto questionDto = sqlSession.selectOne(QUESTIONNAMSESPACE + "selectOneQuestion" , questionboard_no);
		
		
		return questionDto;
	}
	
	public QuestionDto selectOneForReplyOrUpdate(int questionboard_no) {
		
		QuestionDto questionDto = sqlSession.selectOne(QUESTIONNAMSESPACE + "selectOneQuestion" , questionboard_no);
		
		
		return questionDto;
	}
	
	//upload Question
	public int uploadQuestion(QuestionDto dto) {
		
		System.out.println(dto);
		int res = sqlSession.update(QUESTIONNAMSESPACE + "uploadQuestion", dto);
		
		return res;
	}
	
	
	//update query
	public int QuestionReply(QuestionDto dto) {
		
		int res = sqlSession.update(QUESTIONNAMSESPACE + "questionReply", dto);
		
		return res;
	}
	
	//update 시 이미지 처리는 어떻게 할 것인가 
	public int QuestionUpdate(QuestionDto dto) {
		
		
		int res = sqlSession.update(QUESTIONNAMSESPACE + "questionUpdate", dto);
		
		return res;
	}
	
	public int QuestionDelete(int questionboard_no) {
		
		
		int res = sqlSession.delete(QUESTIONNAMSESPACE + "questionDelete", questionboard_no);
	
		return res;
		
	}

	@Override
	public int countBoard() {
		
		int count = sqlSession.selectOne(QUESTIONNAMSESPACE + "countBoard");
		
		return count;
	}

	
	
	
	
}
