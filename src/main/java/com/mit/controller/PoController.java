package com.mit.controller;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mit.model.PlanDTO;
import com.mit.service.PlanService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/po/*")
public class PoController {
	
	PlanService ps;
	
	
	@GetMapping("partner")
	public String partner() {
		return "/po/inputStatusShipment";
	}
	
	@PostMapping("printpo")
	public String printpo(HttpServletRequest request /* post로 받을 값(DTO) */) {
		String referer = (String)request.getHeader("REFERER");
		
		String url = request.getRequestURL().toString().replace(request.getRequestURI(), "");
		String prevUri = "/po/plan";
		
		if(!referer.equals(url + prevUri)) {
			return "/po/dashboard";
		}
		
		return "/po/printPO";
	}
	
	@GetMapping("dashboard")
	public void goDashboard() {
		
	}
	
	@GetMapping("plan")
	public void goPlan(Model m) {
		m.addAttribute("planNumList", ps.getPlanNumsList());
		
		m.addAttribute("productList", ps.getProductList());
		
		m.addAttribute("eplList", ps.getEplList());
	}
	
	@PostMapping("inputpo")
	public String inputPlan(PlanDTO planDto, RedirectAttributes rttr) {
		if(ps.isEmplInPlan(planDto.getEplNum() + "")) {
			rttr.addAttribute("msg", "해당 ID는 이미 하나의 계획의 담당자입니다.");
			
			return "redirect:/po/plan";
		}
		
		rttr.addFlashAttribute("success", ps.insertPlan(planDto));
		
		return "redirect:/po/plan";
	}
	
	/* plan.jsp에서 ajax를 이용해 접근 */
	@ResponseBody
	@PostMapping("ajaxplan")
	public Object getPlan(String planNum) {
		
		if(planNum.equals("0")) {
			return null;
		}
		
		HashMap<String, String> map = this.getNotNullFields(ps.getPlanByPlanNum(planNum));
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("ajaxproduct")
	public Object getProduct(String productNum) {
		
		if(productNum.equals("0")) {
			return null;
		}
		
		HashMap<String, String> map = this.getNotNullFields(ps.getProductByProductNum(productNum));
		
		return map;
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
