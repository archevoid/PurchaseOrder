package com.mit.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.Document;
import com.mit.model.CurPageDTO;
import com.mit.model.InspectionDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PageDTO;
import com.mit.model.PlanDTO;
import com.mit.service.InspectionService;
import com.mit.service.OrderService;
import com.mit.service.PdfService;
import com.mit.service.PlanService;
import com.mit.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/po/*")
public class PoController {
	
	PlanService ps;
	OrderService os;
	InspectionService is;
	UserService us;
	
	
	/* 파일 저장 경로 (root-context에 선언) */
	@Resource(name = "pathOfInspectionFile")
	String pathOfInspectionFile;
	
	
	@GetMapping("dashboard")
	public void goDashboard() {
		
	}
	
	@GetMapping("plan")
	public void goPlan(CurPageDTO curPageDto, PlanDTO planDto, Model m) {
		planDto.setCurPageDto(curPageDto);
		
		m.addAttribute("planList", ps.getPlan(planDto));
		
		Long numberOfPlan = ps.countPlan(planDto);
		
		m.addAttribute("numberOfPlan", numberOfPlan);
		
		m.addAttribute("pageInfo", new PageDTO(curPageDto, numberOfPlan));
		
		
		HashMap<String, Character> currency = new HashMap<String, Character>();
		
		currency.put("KRW", '\u20A9');
		currency.put("USD", '\u0024');
		currency.put("EUR", '\u20AC');
		currency.put("JPN", '\u00A5');
		currency.put("CNY", '\u00A5');
		currency.put("other", '\u00A4');
		
		m.addAttribute("currency", currency);
		
		m.addAttribute("partList", ps.getPartInPlan(planDto));
	}
	
	@GetMapping("order")
	public void goOrder(OrderDTO orderDto, CurPageDTO curPageDto, Model m) {
		orderDto.setCurPageDto(curPageDto);
		
		m.addAttribute("orderList", os.getOrder(orderDto));
		
		Long numberOfOrder = os.countOrder(orderDto);
		
		m.addAttribute("numberOfOrder", numberOfOrder);
		
		m.addAttribute("pageInfo", new PageDTO(curPageDto, numberOfOrder));
		
		m.addAttribute("emplList", us.getEmpl());
		m.addAttribute("partList", os.getAllPart());
		m.addAttribute("companyList", os.getAllCompany());
	}
	
	@GetMapping("partner")
	public String partner() {
		return "/po/inputStatusShipment";
	}
	
	@PostMapping("printpo")
	public String printpo(OrderDTO orderDto, HttpServletRequest request, HttpServletResponse response, Model m) {
		String referer = (String)request.getHeader("REFERER");
		
		String url = request.getRequestURL().toString().replace(request.getRequestURI(), "");
		String prevUri = "/po/order";
		
		if(!referer.equals(url + prevUri)) {
			return "/po/dashboard";
		}
		
		HashMap<String, Character> currency = new HashMap<String, Character>();
		
		currency.put("KRW", '\u20A9');
		currency.put("USD", '\u0024');
		currency.put("EUR", '\u20AC');
		currency.put("JPN", '\u00A5');
		currency.put("CNY", '\u00A5');
		currency.put("other", '\u00A4');

		
		m.addAttribute("orderInfo", os.getOrderInfo(orderDto));
		
		m.addAttribute("currency", currency);
		
		os.updatePublished(orderDto);
		
		m.addAttribute("orderNum", os.getOrderNum(orderDto));
		
		m.addAttribute("ourCompany", os.getOurCompany());
		
		return "/po/printpo";
	}
	
	@GetMapping("/inspection")
	public void goInspection(CurPageDTO curPageDto, InspectionDTO inspectionDto, Model m) {
		
//		m.addAttribute("orderNumList", is.getOrderAllNum());
		
		inspectionDto.setCurPageDto(curPageDto);
		
		Long numberOfInspection = is.countInspection(inspectionDto);
		
		m.addAttribute("pageInfo", new PageDTO(curPageDto, numberOfInspection));
		
		m.addAttribute("inspectionList", is.getInspection(inspectionDto));
		
		m.addAttribute("numberOfInspection", is.countInspection(inspectionDto));
		
		m.addAttribute("orderNumList", is.getOrderNum());
		
	}
	
	
	@GetMapping("progress")
	public void progress(CurPageDTO curPageDto, OrderDTO orderDto, Model m) {
		orderDto.setCurPageDto(curPageDto);
		
		m.addAttribute("orderList", os.searchOrderProgress(orderDto));
		
		
		Long numberOfProgress = os.countProgress(orderDto);
		
		m.addAttribute("numberOfProgress", numberOfProgress);
		
		m.addAttribute("pageInfo", new PageDTO(curPageDto, numberOfProgress));
	}
	
	@PostMapping("inputpo")
	public String inputPlan(PlanDTO planDto, RedirectAttributes rttr) {
		return "redirect:/po/plan";
	}
	
	@PostMapping("updatepo")
	public String updatePlan(PlanDTO planDto, RedirectAttributes rttr) {
		return "redirect:/po/plan";
	}
	
	@GetMapping("list")
	public void goList() {
		
	}
	
	private <DTO> HashMap<String, String> getNotNullFields(DTO dto) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		try {
			Class<?> cls = Class.forName(dto.getClass().getName());
			
			Field[] fields = cls.getDeclaredFields();
			Method[] methods = cls.getDeclaredMethods();
			
			for(Method m : methods) {
				if(!m.getName().contains("get")) {
					continue;
				}
				
				for(Field f : fields) {
					
					if(m.getName().replace("get", "").equalsIgnoreCase(f.getName())) {
						Object result = m.invoke(dto);
						
						if(result != null) {
							map.put(f.getName(), result.toString());
						}
					}
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return map;
	}
}
