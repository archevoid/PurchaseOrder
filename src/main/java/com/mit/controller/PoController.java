package com.mit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/po/*")
public class PoController {
	
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
	public void goPlan() {
		
	}
}
