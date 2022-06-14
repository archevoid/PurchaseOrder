package com.mit.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mit.model.UserDAO;
import com.mit.model.UserDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	UserDAO userDAO;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName: " + username);
		
		UserDTO userDTO = userDAO.getUserById(username);
		
		log.warn("queried by userDAO: " + userDTO);
		
		return userDAO == null ? null : new CustomUser(userDTO);
	}

	
}
