package com.power.bean.dao;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonParser;
import com.power.bean.dto.ClassDto;

@Repository
public class ClassDaoImpl implements ClassDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ClassDto> selectClassList() {
		
		List<ClassDto> classList = sqlSession.selectList(CLASSNAMESPACE + "selectClassList");
		
		return classList;
	}

	@Override
	public List<ClassDto> selectPayingClassList(int member_no, String imp_uid) {
		
		//검색할 단어 "member_no" : "imp_uid"
		String searchString = "\"" + member_no + "\" : \"" + imp_uid + "\"";
		
		List<ClassDto> payingClassList = sqlSession.selectList(CLASSNAMESPACE + "selectPayingClassList", searchString);
		
		return payingClassList;
	}

	@Override
	public ClassDto selectOneClass(int class_no) {
		
		ClassDto classDto = sqlSession.selectOne(CLASSNAMESPACE + "selectOneClass", class_no);
		
		return classDto;
	}

	//TODO : 무엇을 업데이트 해야 생각해보기
	@Override
	public int updateClassinform(ClassDto classDto) {
		
		int res = sqlSession.update(CLASSNAMESPACE + "updateClassinform", classDto);
		
		return res;
	}

	@Override
	// TODO : 문자열 처리로 할 지 json으로 넣을 지 생각 
	public int updateClassStudent(int class_no, int member_no, String impuid) {
		
		//nowNumber에 따라 다르게 해야한다
		String addMemberString = "\"" + member_no + "\" : \"" + impuid + "\"";
		
		String updateStudent;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ClassDto existingClass = selectOneClass(class_no);
		
		if(existingClass.getClass_now() == 0) {
			
			updateStudent = existingClass.getClass_memberName() + addMemberString;
			
		}else {
			
			updateStudent = existingClass.getClass_memberName() + "," + addMemberString;
			
		}
		
		map.put("class_no", class_no);
		map.put("updateStudent", updateStudent);

		int res = sqlSession.update(CLASSNAMESPACE + "updateClassStudent", map);
		
		return res;
	}
	
	

	@Override
	public int classFin(int class_no) {
		
		int res = sqlSession.update(CLASSNAMESPACE + "classFin", class_no);
		
		return res;
	}

	@Override
	public int classDelete(int class_no) {
		
		int res = sqlSession.update(CLASSNAMESPACE + "classDelete", class_no);
		
		return res;
	}

	@Override
	public int StudentRun(int class_no, int member_no, String imp_uid) {
		
		ClassDto existDto = selectOneClass(class_no);
		String existClass = "{" + existDto.getClass_memberName() + "}";
		
		//JSONObject studentObject = new JSONObject(existClass);
		
		
		
		return 0;
		
	}

	//TODO : CLASS를 트레이너가 등록하는 것도 만들 것
	
}
