
package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.power.bean.dao.ReviewDao;
import com.power.bean.dto.PagingDto;
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
	public ReviewDto review_selectOne(int reviewboard_no) {
		return dao.review_selectOne(reviewboard_no);
	}

	@Override
	public int review_insert(ReviewDto dto) {
		return dao.review_insert(dto);
	}

	@Override
	public int review_update(ReviewDto dto) {
		return dao.review_update(dto);
	}

	@Override
	public int review_delete(int reviewboard_no) {
		return dao.review_delete(reviewboard_no);
	}

	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	@Override
	public List<ReviewDto> selectBoard(PagingDto dto) {
		return dao.selectBoard(dto);
	}

	@Transactional
	@Override
	public String reviewboard() {

		// 첫번째 작업
		dao.review_insert(new ReviewDto(0, 0, "작성자", "제목", "내용", null, 0, "Y", "강좌", "선생님", 0));

		// 두번재 작업
		String reviewboard = dao.reviewboard();

		// 널포인트
		reviewboard.length();

		return reviewboard;
	}

}