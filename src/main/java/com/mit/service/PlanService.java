package com.mit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.CompanyDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PlanDAO;
import com.mit.model.PlanDTO;
import com.mit.model.UserDTO;

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
	
	public List<CompanyDTO> getCompanyInfo(PlanDTO planDto) {
		return planDao.getCompanyInfo(planDto);
	}
	
	public int insertOrder(OrderDTO orderDto) {
		return planDao.insertOrder(orderDto);
	}
	
	public List<UserDTO> getEmpl(UserDTO userDto) {
		return planDao.getEmpl(userDto);
	}
	
	public UserDTO getEmailByEmplNum(UserDTO userDto) {
		return planDao.getEmailByEmplNum(userDto);
	}
	
	public OrderDTO getTotalPrice(PlanDTO planDto) {
		return planDao.getTotalPrice(planDto);
	}
	
	public long getRemainQuantity(PlanDTO planDto) {
		return planDao.getRemainQuantity(planDto);
	}
	
	public OrderDTO getCurrentOrder(PlanDTO planDto) {
		return planDao.getCurrentOrder(planDto);
	}
}
