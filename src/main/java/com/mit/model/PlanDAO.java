package com.mit.model;

import java.util.List;

public interface PlanDAO {
	List<Long> getPlanNumList();
	PlanDTO getPlanByPlanNum(String planNum);
	int updatePlan(PlanDTO dto);
}
