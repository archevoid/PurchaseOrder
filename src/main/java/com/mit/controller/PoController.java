package com.mit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mit.model.FileDTO;
import com.mit.model.OrderDTO;
import com.mit.model.PlanDTO;
import com.mit.service.InspectionService;
import com.mit.service.OrderService;
import com.mit.service.PlanService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/po/*")
public class PoController {
	
	PlanService ps;
	OrderService os;
	InspectionService is;
	
	/* 파일 저장 경로 (root-context에 선언) */
	@Resource(name = "pathOfInspectionFile")
	String pathOfInspectionFile;
	
	
	@GetMapping("dashboard")
	public void goDashboard() {
		
	}
	
	@GetMapping("plan")
	public void goPlan(Model m) {
		m.addAttribute("planNum", ps.getAllPlanNum());
	}
	
	@GetMapping("order")
	public void goOrder(Model m) {
		m.addAttribute("companies", os.getCompany());
	}
	
	@GetMapping("partner")
	public String partner() {
		return "/po/inputStatusShipment";
	}
	
	@PostMapping("printpo")
	public String printpo(OrderDTO orderDto, HttpServletRequest request, Model m) {
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
		
		return "/po/printpo";
	}
	
	@GetMapping("/inspection")
	public void goInspection(Model m) {
		m.addAttribute("orderList", is.getNotFinishedOrder());
	}
	
	
	@GetMapping("progress")
	public void progress(Model m) {
		
	}
	
	@PostMapping("inputpo")
	public String inputPlan(PlanDTO planDto, RedirectAttributes rttr) {
		return "redirect:/po/plan";
	}
	
	@PostMapping("updatepo")
	public String updatePlan(PlanDTO planDto, RedirectAttributes rttr) {
		return "redirect:/po/plan";
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
