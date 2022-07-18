package com.mit.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mit.model.CompanyDTO;
import com.mit.model.InspectionDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PlanDTO;
import com.mit.model.UserDTO;
import com.mit.service.InspectionService;
import com.mit.service.OrderService;
import com.mit.service.PlanService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/*")
public class ApiController {
	
	PlanService ps;
	OrderService os;
	InspectionService is;
	
	@GetMapping("plan")
	public PlanDTO getPlan(String planNum) {
		return ps.getPlanByPlanNum(planNum);
	}
	
	@GetMapping("companyInfo")
	public List<CompanyDTO> getCompanyInfo(PlanDTO planDto) {
		return ps.getCompanyInfo(planDto);
	}
	
	@PostMapping("inputOrder")
	public int insertOrder(OrderDTO orderDto) {
		System.out.println(orderDto);
		
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
	public OrderDTO getTotalPrice(PlanDTO planDto) {
		return ps.getTotalPrice(planDto);
	}
	
	@PostMapping("remainQuantity")
	public String getRemainQuantity(PlanDTO planDto) {
		return ps.getRemainQuantity(planDto) + "";
	}
	
	@PostMapping("orderList")
	public List<OrderDTO> getOrderList(Date date) {
		return os.getOrderByMonth(date);
	}
	
	@PostMapping("orderNum")
	public List<InspectionDTO> getOrderNum() {
		return is.getOrderNum();
	}
	
	@PostMapping("currentOrder")
	public OrderDTO getCurrentOrder(PlanDTO planDto) {
		return ps.getCurrentOrder(planDto);
	}
	
	@PostMapping("inspection")
	public List<InspectionDTO> getInspectionByOrderNum(InspectionDTO inspectionDto) {
		return is.getInspectionByOrderNum(inspectionDto);
	}
	
	@PostMapping("nextInspectionNum")
	public Integer getNextInspectionNum(InspectionDTO inspectionDto) {
		return is.getNextInspectionNum(inspectionDto);
	}
	
	@PostMapping("inputInspection")
	public Integer insertInspection(InspectionDTO inspectionDto) {
		System.out.println(inspectionDto);
		return is.insertInspectionSchedule(inspectionDto);
	}
	
	@PostMapping("inputResult")
	public Integer insertInspectionResult(InspectionDTO inspectionDto) {
		return is.insertInspectionResult(inspectionDto);
	}
	
	@PostMapping("sendOrder")
	public void sendOrder(String elem, String to) {
		try {
			os.sendOrder(elem, to);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("finalInspection")
	public Byte isFinalInspection(OrderDTO orderDto) {
		return is.isFinalInspection(orderDto);
	}
}
