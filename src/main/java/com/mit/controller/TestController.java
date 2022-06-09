package com.mit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/basic/*")
@Controller
public class TestController {
	@GetMapping("*")
	public void test() {
		
	}
}
