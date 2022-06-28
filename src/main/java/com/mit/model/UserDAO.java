package com.mit.model;

public interface UserDAO {
	UserDTO getUserById(String userid);
	
	int doRegistUser(UserDTO userDTO);
	int doRegistEmpl(UserDTO userDTO);
	
	int updatePasswordByEmail(UserDTO userDto);
}
