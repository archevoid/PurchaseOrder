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
		
		/* 이전페이지 확인하는 코드 */
		
		return "/po/printPO";
	}
	
	@GetMapping("dashboard")
	public void goDashboard() {
		
	}
}
