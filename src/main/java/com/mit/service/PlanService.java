package com.mit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.CompanyDTO;
import com.mit.model.PlanDAO;
import com.mit.model.PlanDTO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class PlanService extends com.mit.service.Service {
	
	PlanDAO planDao;
	
	public Long[] getAllPlanNum() {
		return planDao.getAllPlanNum();
	}
	
	public PlanDTO getPlanByPlanNum(String planNum) {
		return planDao.getPlanByPlanNum(planNum);
	}
	
	public List<CompanyDTO> getCompanyInfoByPartName(String partName) {
		return planDao.getCompanyInfoByPartName(partName);
	}
}
