package com.mit.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mit.model.UserDTO;

import lombok.Setter;


/* 
 * UserDAO에서 getUserByID(String)로 생성: 
 * getUserByID(String)에서 autowired로 생성한 후
 * user값 변경한 후 반환
*/
public class UserDetailsImpl implements UserDetails {
	private static final long serialVersionUID = 1L;

	@Setter
	UserDTO userDTO;
	
	@Autowired
	public BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		
		authList.add(new SimpleGrantedAuthority(userDTO.getAuthority()));
		
		return authList;
	}

	@Override
	public String getPassword() {
		return bcryptPasswordEncoder.encode(userDTO.getPassword());
	}

	@Override
	public String getUsername() {
		return userDTO.getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
