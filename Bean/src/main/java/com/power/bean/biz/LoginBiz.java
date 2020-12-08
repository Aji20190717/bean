package com.power.bean.biz;

import com.power.bean.dto.LoginDto;

public interface LoginBiz {

	public LoginDto login(LoginDto dto);
	public int resister(LoginDto dto);
	public boolean idChk(String id);
	
}
