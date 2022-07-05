package com.mit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mit.model.UserDTO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	
	private static final long serialVersionUID = 4359008603039319949L;
	
	private UserDTO userDTO;

	
	public CustomUser(String emplNum, String password, Collection<? extends GrantedAuthority> authorities) {
		super(emplNum, password, authorities);
	}
	
	public CustomUser(UserDTO userDTO) {
		super(userDTO.getEmplNum(), userDTO.getPassword(),  
				userDTO.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.userDTO = userDTO;
	}
}
