package com.power.bean.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReviewDto> selectList() {
		List<ReviewDto>list=new ArrayList<ReviewDto>();

		try {
			list=sqlSession.selectList(NAMESPACE+"selectList");
		}catch(Exception e){
			System.out.println("[ERROR]selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ReviewDto selectOne(int reviewboard_no) {

		ReviewDto dto=null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectOne",reviewboard_no);			
		}catch(Exception e) {
			System.out.println("[ERROR]selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res=0;
		try {
			res=sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("[ERROR]insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ReviewDto dto) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"update",dto);
		}catch (Exception e) {
			System.out.println("[ERROR]uodate");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int reviewboard_no) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"delete",reviewboard_no);
		} catch (Exception e) {
			System.out.println("[ERROR]delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public String reviewboard() {
		return null;
	}

}