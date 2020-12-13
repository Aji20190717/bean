package com.power.bean.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.QuestionDto;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//TODO : paging 관련
	public List<QuestionDto> selectQuestionList(){
		
		List<QuestionDto> dtolist = sqlSession.selectList(QUESTIONNAMSESPACE + "selectQuestionList");
		
		return dtolist;
	}
	
	//TODO : 조회수 관련 처리
	public QuestionDto selectOneQuestion(int questionboard_no) {
		
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
	//날짜 처리는 어떻게 할 것인가
	public int QuestionReply(QuestionDto dto) {
		
		int res = sqlSession.update(QUESTIONNAMSESPACE + "questionReply", dto);
		
		return res;
	}
	
	//update 시 이미지 처리는 어떻게 할 것인가 
	public int QuestionUpdate(QuestionDto dto) {
		
		int res = sqlSession.update(QUESTIONNAMSESPACE + "questionUpdate", dto);
		
		return res;
	}
	
	//TODO : 유효성 처리
	public int QuestionDelete(int questionboard_no) {
		
		int res = sqlSession.delete(QUESTIONNAMSESPACE + "questionDelete", questionboard_no);
	
		return res;
		
	}

	
	
}
