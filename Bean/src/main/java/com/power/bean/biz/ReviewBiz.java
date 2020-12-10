package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectList();
	public ReviewDto selectOne(int reviewboard_no);
	public int insert(ReviewDto dto);
	public int update(ReviewDto dto);
	public int delete(int reviewboard_no);
	
	public String reviewboard();

}