package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.ClassDto;
import com.power.bean.dto.PagingDto;

public interface ClassDao {
	
	String CLASSNAMESPACE = "class.";
	
	public List<ClassDto> selectClassList(PagingDto pagingDto);
	// member_no : imp_uid 와 맞는 class 검색
	public List<ClassDto> selectPayingClassList(int member_no);
	public ClassDto selectOneClass(int class_no);
	public int updateClassinform(ClassDto classDto);
	//class를 클릭해 결제를 진행할 때 member_no, imp_uid를 json 형태로 저장
	public int updateClassStudent(int Class_no, int member_no, String impuid);
	public int classFin(int class_no);
	public int classDelete(int class_no);
	public int StudentRun(int class_no, int member_no);
	public int insertClass(ClassDto classDto);
	//트레이너 번호를 넣으면 트레이너가 담당한 class를 보여준다
	public List<ClassDto> selectTrainerClass(int member_no);
	public int countClass();
	
	

}

