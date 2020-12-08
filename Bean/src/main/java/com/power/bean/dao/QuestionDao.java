package com.power.bean.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.QuestionDto;

@Repository
public class QuestionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String NAMESPACE = ".question";
	

	//TODO : paging 관련
	public List<QuestionDto> selectQuestionList(){
		
		List<QuestionDto> dtolist = sqlSession.selectList(NAMESPACE + "selectQuestionList");
		
		return null;
	}
	
	//TODO : 조회수 관련 처리
	public QuestionDto selectOneQuestion(int questionboard_no) {
		
		return null;
	}
	
	//TODO : OCR python 연결
	public int uploadQuestion(QuestionDto dto) {
		
		return 0;
	}
	
	
	//update query
	//날짜 처리는 어떻게 할 것인가
	public int QuestionReply(QuestionDto dto) {
		
		return 0;
	}
	
	//update 시 이미지 처리는 어떻게 할 것인가 
	public int QuestionUpdate(QuestionDto dto) {
		
		return 0;
	}
	
	//TODO : 유효성 처리
	public int QuestionDelete(int questionboard_no) {
	
		return 0;
		
	}

	
	
}
