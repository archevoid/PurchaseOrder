package com.mit.model;

public interface UserDAO {
	UserDTO getUserById(UserDTO userDTO);
	
	int doRegistUser(UserDTO userDTO);
	int doRegistEmpl(UserDTO userDTO);
	
	int updatePasswordByEmail(UserDTO userDto);
}
