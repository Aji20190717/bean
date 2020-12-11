package com.power.bean.dao;

import com.power.bean.dto.LoginDto;

public interface LoginDao {
	
	String NAMESPACE = "login.";

	public LoginDto login(LoginDto dto);
	public int resister(LoginDto dto);
	public boolean idChk(String id);
	public boolean emailChk(String email);
	
}
