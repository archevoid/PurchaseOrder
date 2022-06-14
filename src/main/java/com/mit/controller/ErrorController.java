package com.mit.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/error")
public class ErrorController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model m) {
		log.info("Access Denied: " + auth);
		
		m.addAttribute("msg", "Access Denied");
	}
}
