package com.power.bean.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.LoginDao;
import com.power.bean.dto.LoginDto;

@Service
public class LoginBizImpl implements LoginBiz {
	
	@Autowired
	private LoginDao dao;

	@Override
	public LoginDto login(LoginDto dto) {
		return dao.login(dto);
	}

	@Override
	public int resister(LoginDto dto) {
		return dao.resister(dto);
	}

	@Override
	public boolean idChk(String id) {
		return dao.idChk(id);
	}
	
	@Override
	public boolean emailChk(String email) {
		return dao.emailChk(email);
	}
	
	@Override
	public LoginDto snsChk(String member_sns) {
		return dao.snsChk(member_sns);		
	}

}
