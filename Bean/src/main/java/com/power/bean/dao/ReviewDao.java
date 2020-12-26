package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.PagingDto;
import com.power.bean.dto.ReviewDto;

public interface ReviewDao {
	
	String NAMESPACE="com.reviewboard.";
	
	public List<ReviewDto> selectList();
	public ReviewDto review_selectOne(int reviewboard_no);
	public int review_insert(ReviewDto dto);
	public int review_update(ReviewDto dto);
	public int review_delete(int reviewboard_no);
	public String reviewboard();
	
	
	
	
	public int countBoard();
	public List<ReviewDto> selectBoard(PagingDto dto);
	
	
}
