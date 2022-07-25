package com.mit.service;

import java.sql.Date;
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
	
	
	public List<PlanDTO> getPlan(PlanDTO planDto) {
		return planDao.getPlan(planDto);
	}
	
	public String getPlanNumByScheduledNum(String scheduledNum) {
		return planDao.getPlanNumByScheduledNum(scheduledNum);
	}
	
	public Long countPlan(PlanDTO planDto) {
		return planDao.countPlan(planDto);
	}
	
	public List<PlanDTO> getPartInPlan(PlanDTO planDto) {
		return planDao.getPartInPlan();
	}
	
	public PlanDTO getRemainExcept(PlanDTO planDto) {
		return planDao.getRemainExcept(planDto);
	}
	
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
	
	public PlanDTO getRemainInfo(PlanDTO planDto) {
		return planDao.getRemainInfo(planDto);
	}
	
	public Boolean getOrderable(PlanDTO planDto) {
		return planDao.getOrderable(planDto);
	}
	
	public Boolean getUpdatable(PlanDTO planDto) {
		return planDao.getUpdatable(planDto);
	}
	
	public OrderDTO getCurrentOrder(PlanDTO planDto) {
		return planDao.getCurrentOrder(planDto);
	}
	
	public PlanDTO getExpectedDate(PlanDTO planDto) {
		return planDao.getExpectedDate(planDto);
	}
}
