package com.mit.model;

import java.sql.Date;
import java.util.List;

public interface PlanDAO {
	List<PlanDTO> getPlan(PlanDTO planDto);
	
	Long countPlan(PlanDTO planDto);

	List<PlanDTO> getPartInPlan();
	
	PlanDTO getRemainExcept(PlanDTO planDto);
	
	String getPlanNumByScheduledNum(String scheduledNum);
	
	Long[] getAllPlanNum();
	
	PlanDTO getPlanByPlanNum(String planNum);
	
	List<CompanyDTO> getCompanyInfo(PlanDTO planDto);
	
	int insertOrder(OrderDTO orderDto);
	
	List<UserDTO> getEmpl(UserDTO userDto);
	
	UserDTO getEmailByEmplNum(UserDTO userDto);
	
	OrderDTO getTotalPrice(PlanDTO planDto);
	
	PlanDTO getRemainInfo(PlanDTO planDto);
	
	Boolean getOrderable(PlanDTO planDto);
	
	Boolean getUpdatable(PlanDTO planDto);
	
	OrderDTO getCurrentOrder(PlanDTO planDto);
	
	
	PlanDTO getExpectedDate(PlanDTO planDto);
}
