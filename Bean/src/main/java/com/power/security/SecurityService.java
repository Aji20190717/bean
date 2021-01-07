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
	}
	

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		
		LoginDto dto = new LoginDto();
		dto = dao.login(member_id);
		
		SecurityUser user = new SecurityUser();
		
		if(dto == null) {
			
			throw new UsernameNotFoundException(member_id);
	
		} else if (dto.getMember_id() == null) {
			
			throw new UsernameNotFoundException(member_id);
		
		} else {
			
			user.setUsername(dto.getMember_id());
			user.setPassword(dto.getMember_pw());
			
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





