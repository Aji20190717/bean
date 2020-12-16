package com.power.bean.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.LoginDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// (비밀번호, 연락처, 주소, 생일, 프로필)
	@Override
	public int myinfoupdate(LoginDto dto) {

		int res = 0;
		System.out.println(dto.getMember_no());

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int withdrawal(int member_no) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "delete", member_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
