package com.mit.model;

import java.util.List;

public interface PlanDAO {
	Long[] getAllPlanNum();
	
	PlanDTO getPlanByPlanNum(String planNum);
	
	List<CompanyDTO> getCompanyInfoByPartName(String partName);
	
	int insertOrder(OrderDTO orderDto);
	
	List<UserDTO> getEmpl(UserDTO userDto);
	
	UserDTO getEmailByEmplNum(UserDTO userDto);
	
	long getTotalPrice(PlanDTO planDto);
	
	long getRemainQuantity(PlanDTO planDto);
}
