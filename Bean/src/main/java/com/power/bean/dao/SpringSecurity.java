package com.power.bean.dao;

import java.util.ArrayList;
import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.power.bean.dto.LoginDto;
import com.power.bean.util.DetailUser;

public class SpringSecurity implements UserDetailsService {

	private final SqlSessionTemplate sqlSession;

	@Autowired
	public SpringSecurity(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("SpringSecurityDao");
		// System.out.println(member_id);

		LoginDto dto = sqlSession.selectOne("member.security", member_id);
		// System.out.println(password);

		String member_type = sqlSession.selectOne("member.security_type", member_id);
		// System.out.println(member_type);

		if (dto == null) {

			throw new UsernameNotFoundException("입력하신 " + member_id + "로 가입된 정보를 찾지 못했습니다.");
		}

		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		// roles.add(new SimpleGrantedAuthority(dto.getMember_type()));


		if (!member_type.equals("A")) {

			roles.add(new SimpleGrantedAuthority("USER"));
			System.out.println("A");

		} else {

			roles.add(new SimpleGrantedAuthority("ADMIN"));
			System.out.println("ELSE");
		}

		DetailUser user = new DetailUser(member_id, dto.getMember_pw(), roles);
		// UserDetails user = new User(dto.getMember_id(), dto.getMember_pw(), roles);
		System.out.println(user.getAuthorities());
		System.out.println(user);

		return user;
	}

}
