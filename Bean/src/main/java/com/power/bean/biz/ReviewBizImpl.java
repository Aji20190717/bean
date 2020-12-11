package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.power.bean.dao.ReviewDao;
import com.power.bean.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	private ReviewDao dao;
	
	
	@Override
	public List<ReviewDto> selectList() {
		return dao.selectList();
	}

	@Override
	public ReviewDto selectOne(int reviewboard_no) {
		return dao.selectOne(reviewboard_no);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int reviewboard_no) {
		// TODO Auto-generated method stub
		return dao.delete(reviewboard_no);
	}

	@Transactional
	@Override
	public String reviewboard() {

		//첫번째 작업
		dao.insert(new ReviewDto(0,0, "작성자","제목","내용", null, 0, "Y", "강좌", "선생님", 0));
		
		//두번재 작업
		String reviewboard=dao.reviewboard();
		
		//널포인트
		reviewboard.length();
		
		return reviewboard;
	}

}
