package com.mit.model;

import java.util.List;

import lombok.Data;

@Data
public class UserDTO {
	private String username;
	private String password;
	private Long deptNum;
	private String emplName;
	private List<AuthVO> authList;
	
	
	/* employee */
	private String email;
}
