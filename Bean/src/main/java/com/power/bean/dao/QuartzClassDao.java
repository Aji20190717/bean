package com.power.bean.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.power.bean.dto.ClassDto;

public class QuartzClassDao {

	String CLASSNAMESPACE = "class.";
	private SqlSessionTemplate sqlSession;

	// setter 주입을 위해 생성
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ClassDto> selectClassList() {

		List<ClassDto> classList = sqlSession.selectList(CLASSNAMESPACE + "selectClassList");

		return classList;
	}

	//자정에 Date 지난 class F 처리
	public int classFin(int class_no) {

		int res = sqlSession.update(CLASSNAMESPACE + "classFin", class_no);

		return res;
	}

}
