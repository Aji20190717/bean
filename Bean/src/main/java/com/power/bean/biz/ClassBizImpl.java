package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.ClassDao;
import com.power.bean.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz{
	
	@Autowired
	private ClassDao classDao;

	@Override
	public List<ClassDto> selectClassList() {
		return classDao.selectClassList();
	}

	@Override
	public List<ClassDto> selectPayingClassList(int member_no, String imp_uid) {
		return classDao.selectPayingClassList(member_no, imp_uid);
	}

	@Override
	public ClassDto selectOneClass(int class_no) {
		return classDao.selectOneClass(class_no);
	}

	@Override
	public int updateClassinform(ClassDto classDto) {
		
		return classDao.updateClassinform(classDto);
	}

	@Override
	public int updateClassStudent(int Class_no, int member_no, String impuid) {
		
		return classDao.updateClassStudent(Class_no, member_no, impuid);
	}

	@Override
	public int classFin(int class_no) {
		return classDao.classFin(class_no);
	}

	@Override
	public int classDelete(int class_no) {
		return classDao.classDelete(class_no);
	}

	//학생이 도망갈 때 
	@Override
	public int StudentRun(int class_no, int member_no, String imp_uid) {
		return 0;
	}
	
	
	
	

}
