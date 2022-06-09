package com.mit.model;

import lombok.Data;

@Data
public class UserDTO {
	private String id;
	private String pw;
	private String auth;
	
	private String deptNum;
}
