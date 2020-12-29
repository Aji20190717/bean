package com.power.bean.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ClassDto> selectPayingClassList(int member_no){
		
		String searchString = "\""+member_no + "\"";
		
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
			
			updateStudent = addMemberString;
			
		}else {
			
			updateStudent = existingClass.getClass_memberName() + " , " + addMemberString;
			System.out.println(updateStudent);
			
		}
		
		map.put("class_no", class_no);
		map.put("updateStudent", updateStudent);	

		int res = sqlSession.update(CLASSNAMESPACE + "updateClassStudent", map);
		
		return res;
	}
	
	
	// batch를 이용해 날짜가 지난 수업들은 전부 Fin 으로 바꿔준다
	@Override
	public int classFin(int class_no) {
		
		int res = sqlSession.update(CLASSNAMESPACE + "classFin", class_no);
		
		return res;
	}

	//TODO : class를 삭제할 경우 학생들에게 모두 환불 처리가 되도록 한다 
	@Override
	public int classDelete(int class_no) {
		
		int res = sqlSession.update(CLASSNAMESPACE + "classDelete", class_no);
		
		return res;
	}

	//학생이 도중에 수강을 포기할 경우 class json String에서 이름을 제거
	@Override
	public int StudentRun(int class_no, int member_no) {
		
		ClassDto existDto = selectOneClass(class_no);
		String existClass = "{" + existDto.getClass_memberName() + "}";
		String newClassMember = "";
		int countNum = 0;
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(existClass);
			JSONObject jsonObj = (JSONObject) obj;
			Iterator keyIterator = jsonObj.keySet().iterator();
			
			
			while(keyIterator.hasNext()) {
				
				String key = (String) keyIterator.next();
				String outKey = "" + member_no;
				
				if(!key.equals(outKey)) {
					
					if(countNum == 0) {
						
						newClassMember += "\"" + key + "\" : \"" + jsonObj.get(key) + "\"";
						
					}else {
						newClassMember += ", \"" + key + "\" : \"" + jsonObj.get(key) + "\"";
					}
					
					countNum +=1;
				}
			}
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		map.put("newClassMember", newClassMember);
		map.put("class_no", class_no);
		res = sqlSession.update(CLASSNAMESPACE + "studentRun", map);
		
		return res;
		
	}
	 
	
	@Override
	public int insertClass(ClassDto classDto) {
		
		int res =  sqlSession.insert(CLASSNAMESPACE + "insertClass", classDto);
		
		return res;
	}

	@Override
	public List<ClassDto> selectTrainerClass(int member_no) {
		
		List<ClassDto> trainerClassList = sqlSession.selectList(CLASSNAMESPACE + "selectTrainerClass", member_no);
		
		return trainerClassList;
	}


	
	
}
