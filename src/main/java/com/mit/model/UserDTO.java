package com.mit.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserDTO {
	private String emplNum;
	private String password;
	private String deptNum;
	private String emplName;
	private List<AuthVO> authList;
	private String email;
	
	/* getEmpl() */
	private Long sameDay;
	private Long sameCompany;
	private Date scheduledDate;
	private Long sameCompanyAtSameDay;
}
