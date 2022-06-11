package com.mit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@GetMapping("/*")
	public void aboutLogin() {
		
	}
	
	@PostMapping("/login")
	public String login(/* 유저 정보 dto */) {
		
		/* 로그인하는 코드 */
		
		return "redirect:/po/dashboard"; /* 가칭 */
	}
}
