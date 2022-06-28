package com.mit.model;

import java.util.List;

import lombok.Data;

@Data
public class UserDTO {
	private String username;
	private String password;
	private List<AuthVO> authList;
	
	
	/* employee */
	private String email;
}
