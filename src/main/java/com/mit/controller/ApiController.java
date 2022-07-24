package com.mit.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.activation.FileDataSource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.mit.model.CompanyDTO;
import com.mit.model.InspectionDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PlanDTO;
import com.mit.model.UserDTO;
import com.mit.service.InspectionService;
import com.mit.service.OrderService;
import com.mit.service.PdfService;
import com.mit.service.PlanService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/*")
public class ApiController {
	
	PlanService ps;
	OrderService os;
	InspectionService is;
	
	PdfService pdfs;
	
	String orderPath;
	
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
		PlanDTO planDto = new PlanDTO();
		
		planDto.setPlanNum(orderDto.getPlanNum());
		planDto.setContractNum(Long.parseLong(orderDto.getContractNum()));
		
		PlanDTO remains = ps.getRemainInfo(planDto);
		
		Date scheduledDate = orderDto.getScheduledDate();
		
		if(orderDto.getOrderQuantity() > remains.getRemainQuantity()) {
			return -1;
		} else if (scheduledDate.after(remains.getDueDate())) {
			return -2;
		} else if (!ps.getOrderable(planDto)) {
			return -3;
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
	public String getRemainInfo(PlanDTO planDto) {
		return ps.getRemainInfo(planDto).getRemainQuantity() + "";
	}
	
	@PostMapping("dateInfo")
	public InspectionDTO getDate(InspectionDTO inspectionDto) {
		return is.getDate(inspectionDto);
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
		return is.insertInspectionSchedule(inspectionDto);
	}
	
	@PostMapping("inputResult")
	public Integer insertInspectionResult(InspectionDTO inspectionDto) {
		return is.insertInspectionResult(inspectionDto);
	}
	
	@PostMapping("sendOrder")
	public void sendOrder(String html, String emailContent, OrderDTO orderDto, String[] addressList) {
		try {
			File dir = new File(orderPath);
			
			if (!dir.exists()) {
				dir.mkdirs();
			}
			
			String fileName = os.getOrderNum(orderDto) + "_발주서";
			fileName += ".pdf";
			
			FileOutputStream fos = new FileOutputStream(orderPath + "/" + fileName);
			
			Document document = new Document(PageSize.A4);
			
			pdfs.makePdf(document, fos, html);
			
			fos.close();
			
			File file = new File(orderPath + "/" + fileName);
			
			FileDataSource fds = new FileDataSource(file);
			
			os.sendOrder(emailContent, addressList, fds);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("resetOrder")
	public OrderDTO getResetOrderData(OrderDTO orderDto) {
		return os.getResetOrderData(orderDto);
	}
	
	@PostMapping("updateOrder")
	public Integer updateOrder(OrderDTO orderDto) {
		return os.updateOrder(orderDto);
	}
	
	@PostMapping("totalInspectionQuantity")
	public InspectionDTO getTotalInspectionQuantity(OrderDTO orderDto) {
		return is.getTotalInspectionQuantity(orderDto);
	}
	
	@PostMapping("maxProgress")
	public Double getMaxProgress(InspectionDTO inspectionDto) {
		System.out.println(inspectionDto);
		System.out.println(is.getMaxProgress(inspectionDto));
		return is.getMaxProgress(inspectionDto);
	}
}
