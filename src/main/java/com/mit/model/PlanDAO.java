package com.mit.model;

import java.util.HashMap;
import java.util.List;

public interface PlanDAO {
	List<Long> getPlanNumList();
	
	List<PlanDTO> getPlanByInputType(HashMap<String, String> map);
	
	List<ProductDTO> getProductList();
	ProductDTO getProductByProductNum(String productNum);
	
	List<PlanDTO> getEmployeeList();
	
	Long getCountEmplInPlan(String eplNum);
	
	Long insertPlan(PlanDTO dto);
	
	Long updatePlan(PlanDTO dto);
	
	List<FileDTO> getOrdinalByPlanNum(String planNum);
	
	FileDTO getMaxOrdinalByPlanNum(String planNum);
	
	Long insertFileInfo(FileDTO fileDto);
	
	FileDTO getFileInfo(FileDTO fileDto);
}
