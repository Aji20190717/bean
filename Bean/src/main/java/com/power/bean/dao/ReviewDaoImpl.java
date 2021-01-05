package com.power.bean.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.PagingDto;
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
	public ReviewDto review_selectOne(int reviewboard_no) {

		ReviewDto dto=null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"review_selectOne",reviewboard_no);			
		}catch(Exception e) {
			System.out.println("[ERROR]selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int review_insert(ReviewDto dto) {
		int res=0;
		try {
			res=sqlSession.insert(NAMESPACE+"review_insert",dto);
		} catch (Exception e) {
			System.out.println("[ERROR]insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int review_update(ReviewDto dto) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"review_update",dto);
		}catch (Exception e) {
			System.out.println("[ERROR]update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int review_delete(int reviewboard_no) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"review_delete",reviewboard_no);
		} catch (Exception e) {
			System.out.println("[ERROR]delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countBoard() {
		int res = sqlSession.selectOne("countBoard");
		return res;
	}
	
	@Override
	public List<ReviewDto> selectBoard(PagingDto dto) {
		
	//	System.out.println(dto.getStart()+" : "+dto.getEnd());
		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		list = sqlSession.selectList("selectBoard",dto);
		
		return list;
	}

	@Override
	public String reviewboard() {
		return null;
	}


	

}