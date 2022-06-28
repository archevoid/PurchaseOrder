package com.mit.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mit.model.UserDAO;
import com.mit.model.UserDTO;


@Service
public class UserService extends NEmailService {
	
	@Resource(name = "FROM_PASSWORD")
	private String FROM;
	
	@Resource(name = "FROM_NAME_PASSWORD")
	private String FROM_NAME;
	
	final int PASSWORD_LENGTH = 10;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	UserDAO userDao;
	
	public void superMaker() {
		super.FROM = this.FROM;
		super.FROM_NAME = this.FROM_NAME;
	}
	
	public void setPassword(String email) {
		superMaker();
		
		String password = this.generatePw(PASSWORD_LENGTH);
		
		try {
			
			UserDTO dto = new UserDTO();
			
			dto.setPassword(bCryptPasswordEncoder.encode(password));
			dto.setEmail(email);
			
			if(userDao.updatePasswordByEmail(dto) != 0) {
				this.sendMail(this.makeMessage(email, "TeamFoS 임시 비밀번호", password));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private String generatePw(int length) {
		char[] base = new char[62];
		
		for(int i = 0; i < 26; i++) {
			if (i < 26) {
				base[i] = (char)('a' + i);
			} else if (i < 26 + 26) {
				base[i] = (char)('A' + i);
			} else {
				base[i] = (char)('0' + i);
			}
		}
		
		char[] password = new char[length];
		
		for(int i = 0; i < length; i++) {
			int randInt = (int)(Math.random() * base.length);
			
			password[i] = base[randInt];
		}
		
		return password.toString();
	}
}
