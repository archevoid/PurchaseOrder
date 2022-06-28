package com.mit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mit.model.AuthVO;
import com.mit.model.EpleeDTO;
import com.mit.service.RegisterService;
import com.mit.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class LoginController {
	
	RegisterService rs;
	
	UserService us;
	
	
	@PostMapping("/register")
	public String register(Integer deptNum, EpleeDTO eDTO, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("Request: /register [ip: " + request.getRemoteAddr() + "]");
		
		if(eDTO == null) {
			log.info("eDTO가 null 입니다.");
			rttr.addFlashAttribute("error", "입력이 되지 않았습니다.");
			return "redirect:/register";
		}
		
		if(deptNum == 1) {
			AuthVO vo = new AuthVO();
			
			vo.setAuth("ROLE_PD");
			
			ArrayList<AuthVO> al = new ArrayList<AuthVO>();
			
			al.add(vo);
			
			eDTO.setAuthList(al);
		}
		
		rs.doRegist(eDTO);
		
		return "redirect:/login";
	}
	
	@PostMapping("/password")
	public String resetPassword(String email) {
		
		us.setPassword(email);
		
		return "redirect:/password";
	}
	
	@GetMapping("/*")
	public void loginPage() {
		
	}
}
