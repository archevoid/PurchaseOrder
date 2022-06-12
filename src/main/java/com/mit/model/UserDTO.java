package com.mit.model;

import lombok.Data;

@Data
public class UserDTO {
	private String id;
	private String password;
	private String authority;
}
