package com.power.bean.biz;

import com.power.bean.dto.LoginDto;

public interface LoginBiz {

	public LoginDto login(String member_id);
	public int resister(LoginDto dto);
	public boolean idChk(String id);
	public boolean emailChk(String email);
	public LoginDto snsChk(String member_sns);
	
}
