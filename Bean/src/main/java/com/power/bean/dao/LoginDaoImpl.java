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

		LoginDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;

	}

	@Override
	public int resister(LoginDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "regist", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	public int kakaoInsert(LoginDto dto) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"kakaoInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public boolean idChk(String id) {

		String idchk = null;

		idchk = sqlSession.selectOne(NAMESPACE + "idChk", id);

		return (idchk != null) ? false : true;

	}

	@Override
	public boolean emailChk(String email) {

		String emailchk = null;

		emailchk = sqlSession.selectOne(NAMESPACE + "emailChk", email);

		return (emailchk != null) ? false : true;

	}
	
	@Override
	public LoginDto snsChk(String member_sns) {
		
		LoginDto dto = new LoginDto();
		
		dto = sqlSession.selectOne(NAMESPACE + "snsChk" , member_sns);
		
		// dto가 비어있지 않다면 false(이미 가입), true(가입 가능)
		return dto;
	}

}
