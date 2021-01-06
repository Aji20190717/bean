package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.MemberDao;
import com.power.bean.dto.LoginDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int myinfoupdate(LoginDto dto) {
		return dao.myinfoupdate(dto);
	}

	@Override
	public int withdrawal(int member_no) {
		return dao.withdrawal(member_no);
	}

	@Override
	public List<LoginDto> selectNormalMember() {
		return dao.selectNormalMember();
	}

	@Override
	public List<LoginDto> selectTrainer() {
		return dao.selectTrainer();
	}

	@Override
	public List<LoginDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public LoginDto selectOneMember(int member_no) {
		return dao.selectOneMember(member_no);
	}

	
	
	
}
