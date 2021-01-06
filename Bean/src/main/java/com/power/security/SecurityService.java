package com.power.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.power.bean.dto.LoginDto;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class SecurityService implements UserDetailsService {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SecurityDao dao;
	
	public SecurityService() {
		log.info("만들었다");
	}

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		
		log.info("## loadUserByUsername ##");
		
		LoginDto dto = new LoginDto();
		dto = dao.login(member_id);
		
		// System.out.println("security service dto : " + dto.getMember_id());
		
		SecurityUser user = new SecurityUser();
		
		if(dto == null) {
			
			log.debug("## 계정 정보가 존재하지 않습니다. ##");
			throw new UsernameNotFoundException(member_id);
	
		} else if (dto.getMember_id() == null) {
			
			log.debug("## dto.getMember_id is null ##");
			throw new UsernameNotFoundException(member_id);
		
		} else {
			
			log.info("## 계정 정보 담는 중 ##");
			user.setUsername(dto.getMember_id());
			user.setPassword(dto.getMember_pw());
			
			System.out.println("security service:" + user.getUsername());
			
			if(!dto.getMember_type().equals("A")) {
				List<String> list = new ArrayList<String>();
				list.add("ROLE_USER");
				user.setAuthorities(list);
			} else {
				List<String> list = new ArrayList<String>();
				list.add("ROLE_ADMIN");
				user.setAuthorities(list);
			}
			
		}
		
		return user;
	}

}
