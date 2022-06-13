package com.mit.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.mit.model.UserDTO;

import lombok.Setter;


@Component
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
		return bcryptPasswordEncoder.encode(userDTO.getPassword()); // 나중에 encode 제거 (db에 bcrypt된 비밀번호가 저장될 때)
	}

	@Override
	public String getUsername() {
		return userDTO.getUsername();
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
