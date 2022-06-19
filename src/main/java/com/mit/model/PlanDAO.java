package com.mit.model;

import java.util.List;

public interface PlanDAO {
	List<Long> getPlanNumList();
	PlanDTO getPlanByPlanNum(String planNum);
	
	List<ProductDTO> getProductList();
	ProductDTO getProductByProductNum(String productNum);
	
	List<PlanDTO> getEmployeeList();
	
	Boolean isEmplInPlan(String eplNum);
	
	Long insertPlan(PlanDTO dto);
	
	Long updatePlan(PlanDTO dto);
}
