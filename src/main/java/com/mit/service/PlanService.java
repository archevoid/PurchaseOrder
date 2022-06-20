package com.mit.service;


import java.util.HashMap;
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
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", "planNum");
		map.put("planNum", planNum);
		
		List<PlanDTO> result =  planDao.getPlanByInputType(map);
		
		return result.size() != 0 ? planDao.getPlanByInputType(map).get(0) : null;
	}
	
	public List<PlanDTO> getPlanByEplNumAndDueDate(String eplNum, String ptnNum, String dueDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", "eplNum dueDate ptnNum");
		map.put("eplNum", eplNum);
		map.put("dueDate", dueDate);
		map.put("ptnNum", ptnNum);
		
		return planDao.getPlanByInputType(map);
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
	
	public Long updatePlan(PlanDTO planDto) {
		return planDao.updatePlan(planDto);
	}
	
	public ProductDTO getProductByProductNum(String productNum) {
		return planDao.getProductByProductNum(productNum);
	}
	
	public Long getCountEmplInPlan(String eplNum) {
		return planDao.getCountEmplInPlan(eplNum);
	}
}
