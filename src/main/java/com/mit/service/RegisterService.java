package com.mit.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mit.model.EpleeDTO;
import com.mit.model.UserDAO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RegisterService {
	UserDAO userDao;
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	private <Beans> boolean hasNullField(Beans bean) {
		try {
			Class<?> cls = Class.forName(bean.getClass().getName());
			
			Method[] methods = cls.getMethods();
			
			for(Method m : methods) {
				if(m.getName().contains("get")) {
					if(m.invoke(bean) == null) {
						return true;
					}
				}
			}
			
			return false;
		} catch (ClassNotFoundException|InvocationTargetException|IllegalAccessException e) {
			return true;
		}
	}
	
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
