package com.mit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.warn("Login Success: " + authentication.getName());
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach( authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		if(roleNames.contains("ROLE_PTN")) {
			response.sendRedirect("/po/partner");
			return;
		} else if (roleNames.contains("ROLE_PD")) {
			response.sendRedirect("/po/dashboard");
//			response.sendRedirect("http://192.168.0.104:8888/index/board");
			return;
		}
	}

}
