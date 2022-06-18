package com.mit.service;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mit.model.EpleeDTO;
import com.mit.model.UserDAO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class RegisterService extends com.mit.service.Service {
	
	UserDAO userDao;
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	private String encodePW(String pw) {
		return bCryptPasswordEncoder.encode(pw);
	}
	
	public void doRegist(EpleeDTO eDTO) {
		if(hasNullField(eDTO)) {
			return;
		}
		
		eDTO.setPassword(this.encodePW(eDTO.getPassword()));
		
		userDao.doRegistUser(eDTO);
		userDao.doRegistEmpl(eDTO);
	}
}
