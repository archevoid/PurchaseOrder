package com.mit.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mit.model.CompanyDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PlanDTO;
import com.mit.model.UserDTO;
import com.mit.service.PlanService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/*")
public class ApiController {
	
	PlanService ps;
	
	@GetMapping("plan")
	public PlanDTO getPlan(String planNum) {
		return ps.getPlanByPlanNum(planNum);
	}
	
	@GetMapping("companyInfo")
	public List<CompanyDTO> getCompanyInfoByPartName(String partName) {
		return ps.getCompanyInfoByPartName(partName);
	}
	
	@PostMapping("inputOrder")
	public int insertOrder(OrderDTO orderDto) {
		PlanDTO planDto = new PlanDTO();
		
		planDto.setPlanNum(orderDto.getPlanNum());
		
		if(orderDto.getOrderQuantity() > ps.getRemainQuantity(planDto)) {
			return -1;
		} else {
			return ps.insertOrder(orderDto);
		}
	}
	
	@PostMapping("empl")
	public HashMap<Long, UserDTO> getEmpl(UserDTO userDto) {
		List<UserDTO> empl = ps.getEmpl(userDto);
		
		HashMap<Long, UserDTO> result = new HashMap<Long, UserDTO>();
		
		long key = 0L;
		for(UserDTO dto : empl) {
			result.put(key++, dto);
		}
		
		return result;
	}
	
	@PostMapping("emplEmail")
	public String getEmplEmail(UserDTO userDto) {
		return ps.getEmailByEmplNum(userDto).getEmail();
	}
	
	@PostMapping("totalPrice")
	public String getTotalPrice(PlanDTO planDto) {
		return ps.getTotalPrice(planDto) + "";
	}
	
	@PostMapping("remainQuantity")
	public String getRemainQuantity(PlanDTO planDto) {
		return ps.getRemainQuantity(planDto) + "";
	}
}
