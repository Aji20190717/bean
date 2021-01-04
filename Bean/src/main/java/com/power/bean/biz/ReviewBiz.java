package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.CriteriaDto;
import com.power.bean.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectList();
	public ReviewDto review_selectOne(int reviewboard_no);
	public int review_insert(ReviewDto dto);
	public int review_update(ReviewDto dto);
	public int review_delete(int reviewboard_no);
	public String test();
	
	
	public List<ReviewDto> review_search(String search, String search_text);
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<ReviewDto> selectBoard(CriteriaDto dto);
}
