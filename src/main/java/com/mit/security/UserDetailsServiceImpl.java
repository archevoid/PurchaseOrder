package com.mit.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	/* 삭제 예정 */
	UserDetailsImpl user;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		/* DAO 생성 후 활성화 예정 */
//		UserDetailsImpl user = userDAO.getUserById(username);
		
		return user;
	}

	
}
