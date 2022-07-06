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
	public UserDetails loadUserByUsername(String emplNum) throws UsernameNotFoundException {
		UserDTO userDao = new UserDTO();
		
		userDao.setDeptNum(emplNum.substring(0, 2));
		userDao.setEmplNum(emplNum.substring(2));
		
		log.warn("Load User By UserName: " + emplNum);
		
		UserDTO userDTO = userDAO.getUserById(userDao);
		
		log.warn("queried by userDAO: " + userDTO);
		
		return userDAO == null ? null : new CustomUser(userDTO);
	}

	
}
