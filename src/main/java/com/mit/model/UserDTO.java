package com.mit.model;

import lombok.Data;

@Data
public class UserDTO {
	private String username;
	private String password;
	private String authority;
}
