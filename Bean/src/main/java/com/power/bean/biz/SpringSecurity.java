package com.power.bean.biz;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.power.bean.dao.LoginDao;

public class SpringSecurity implements UserDetailsService {
	
	@Autowired
	private LoginDao dao;

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("SpringSecurityBiz");
		 String password = dao.getUsersByID(member_id);

			if (password == null) {

			         throw new UsernameNotFoundException("입력하신 " + member_id + "로 가입된 정보를 찾지 못했습니다.");
			}	 

		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		     roles.add(new SimpleGrantedAuthority("ROLE_USER"));

		    UserDetails user = new User(member_id, password, roles);

	           return user;
	}
	
}
