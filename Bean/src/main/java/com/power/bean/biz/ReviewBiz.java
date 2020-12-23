package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectList();
	public ReviewDto review_selectOne(int reviewboard_no);
	public int review_insert(ReviewDto dto);
	public int review_update(ReviewDto dto);
	public int review_delete(int reviewboard_no);
	
	public String reviewboard();

}
