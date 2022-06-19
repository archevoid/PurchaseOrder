package com.mit.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.PlanDAO;
import com.mit.model.PlanDTO;
import com.mit.model.ProductDTO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class PlanService extends com.mit.service.Service {
	
	PlanDAO planDao;
	
	
	public List<Long> getPlanNumsList() {
		return planDao.getPlanNumList();
	}
	
	public PlanDTO getPlanByPlanNum(String planNum) {
		return planDao.getPlanByPlanNum(planNum);
	}
	
	public List<ProductDTO> getProductList() {
		return planDao.getProductList();
	}
	
	public List<PlanDTO> getEplList() {
		return planDao.getEmployeeList();
	}
	
	public Long insertPlan(PlanDTO planDto) {
		return planDao.insertPlan(planDto);
	}
	
	public ProductDTO getProductByProductNum(String productNum) {
		return planDao.getProductByProductNum(productNum);
	}
}
