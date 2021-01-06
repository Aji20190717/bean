package com.power.bean.dao;

import com.power.bean.dto.LoginDto;

public interface LoginDao {
	
	String NAMESPACE = "login.";

	public LoginDto login(String member_id);
	public int resister(LoginDto dto);
	public boolean idChk(String id);
	public boolean emailChk(String email);
	public LoginDto snsChk(String member_sns);
	public int kakaoInsert(LoginDto dto);
	
}
