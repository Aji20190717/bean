package com.power.bean.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public LoginDto login(LoginDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int resister(LoginDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean idChk(String id) {

		String idchk = null;
		
		idchk = sqlSession.selectOne(NAMESPACE + "idChk", id);

		return (idchk != null)? false : true;
		
	}

}
