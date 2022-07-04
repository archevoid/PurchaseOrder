package com.mit.model;

import java.util.List;

public interface PlanDAO {
	Long[] getAllPlanNum();
	
	PlanDTO getPlanByPlanNum(String planNum);
	
	List<CompanyDTO> getCompanyInfoByPartName(String partCode);
}
