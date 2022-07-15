package com.mit.model;

import java.util.List;

public interface UserDAO {
	UserDTO getUserById(UserDTO userDTO);
	
	int doRegistUser(UserDTO userDTO);
	int doRegistEmpl(UserDTO userDTO);
	
	int updatePasswordByEmail(UserDTO userDto);
	
	List<UserDTO> getEmpl();
}
