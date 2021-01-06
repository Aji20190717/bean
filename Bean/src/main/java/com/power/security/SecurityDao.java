package com.power.security;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.LoginDto;

@Repository
public class SecurityDao {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public SecurityDao(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public LoginDto login(String member_id) {
		
		log.info("dao.login");

		LoginDto res = null;

		try {
			res = sqlSession.selectOne("login.login", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info(res.getMember_id());
		return res;

	}

}




