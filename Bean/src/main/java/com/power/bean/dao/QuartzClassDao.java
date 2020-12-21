package com.power.bean.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.quartz.simpl.SystemPropertyInstanceIdGenerator;

import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;

public class QuartzClassDao {

	private String CLASSNAMESPACE = "class.";
	private String MEMBERNAMESPACE = "member.";

	private SqlSessionTemplate sqlSession;

	// setter 주입을 위해 생성
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ClassDto> selectClassList() {

		List<ClassDto> classList = sqlSession.selectList(CLASSNAMESPACE + "selectClassList");

		return classList;
	}

	// 자정에 Date 지난 class F 처리
	public int classListFin() {

		int res = sqlSession.update(CLASSNAMESPACE + "classListFin");

		return res;
	}

	// class를 수강하고 있는 학생들의 키값을 출력
	public List<String> FinStudentList() {

		// 자정이 지난 후 전날에 끝난 class들의 list를 출력
		List<ClassDto> FinClassList = sqlSession.selectList(CLASSNAMESPACE + "FinYesterDayClassList");

		// 수업이 전날 종료된 학생 번호 : 학생이 들었던 class를 json 형식으로 반환
		List<String> studentList = new ArrayList<String>();

		for (ClassDto classDto : FinClassList) {

			if (classDto.getClass_memberName() != null) {

				String studentIDList = "{" + classDto.getClass_memberName() + "}";
				JSONParser parser = new JSONParser();

				try {
					Object obj = parser.parse(studentIDList);
					JSONObject jsonObj = (JSONObject) obj;
					Iterator keyIterator = jsonObj.keySet().iterator();

					while (keyIterator.hasNext()) {

						String key = (String) keyIterator.next();
						String addStudentAndClass = "\"" + key + "\" : \"" + classDto.getClass_no() + "\"";
						studentList.add(addStudentAndClass);

					}

				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}

		return studentList;

	}

	// TODO : 수업이 끝난 학생들의 번호, 수업 번호를 받아 jsonString으로 처리
	public List<String> classFinStudentClassInform(List<String> studentClassInform) {

		List<String> classFinStudentClassInformList = new ArrayList<String>();
		JSONParser parser = new JSONParser();
		for (String informString : studentClassInform) {

			String jsonString = "{" + informString + "}";
			Object obj;
			try {
				obj = parser.parse(jsonString);
				JSONObject jsonObj = (JSONObject) obj;
				Iterator keyIterator = jsonObj.keySet().iterator();
				
				
				while(keyIterator.hasNext()) {
					
					
					String stringkey = keyIterator.next().toString();
					int key = Integer.parseInt(stringkey);
					int classkey = Integer.parseInt((String) jsonObj.get(stringkey));
		
					LoginDto memberDto = sqlSession.selectOne( MEMBERNAMESPACE+"selectOneMember", key);
					ClassDto classDto = sqlSession.selectOne(CLASSNAMESPACE + "selectOneClass", classkey);
					String className = classDto.getClass_name();
					String email = memberDto.getMember_email();
					String appendString = "\"" + className + "\":\"" + email +"\"";
					
					classFinStudentClassInformList.add(appendString);
					
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}

		return classFinStudentClassInformList;
	}

}
