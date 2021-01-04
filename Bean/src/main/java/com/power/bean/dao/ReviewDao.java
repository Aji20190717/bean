package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.CriteriaDto;
import com.power.bean.dto.ReviewDto;

public interface ReviewDao {
	
	String NAMESPACE="com.reviewboard.";
	
	public List<ReviewDto> selectList();
	public ReviewDto review_selectOne(int reviewboard_no);
	public int review_insert(ReviewDto dto);
	public int review_update(ReviewDto dto);
	public int review_delete(int reviewboard_no);
	public String test();
	
	
	public List<ReviewDto> review_search(String search, String search_text);
	
	
	public int countBoard();
	public List<ReviewDto> selectBoard(CriteriaDto dto);
	
	
}
