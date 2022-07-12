package com.mit.controller;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mit.model.CommonDTO;
import com.mit.service.CommonService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	CommonService cs;
	
	/* 파일 저장 경로 (root-context에 선언) */
	@Resource(name = "pathOfInspectionFile")
	String pathOfInspectionFile;
	
	@GetMapping("company")
	public void company(CommonDTO commonDto, Model m) {
		m.addAttribute("companyList", cs.getCompanyList(commonDto));
		m.addAttribute("partList", cs.getPartList(commonDto));
	}
	
	@GetMapping("part")
	public void part(CommonDTO commonDto, Model m) {
		m.addAttribute("companyList", cs.getCompanyList(commonDto));
		m.addAttribute("partList", cs.getPartList(commonDto));
	}
	
	@PostMapping("addcompany")
	public String addCompany(CommonDTO commonDto) {
		if (commonDto != null) {
			
			cs.insertCompany(commonDto);
		}
		
		return "redirect:/admin/company";
	}
	
	@PostMapping("addpart")
	public String addPart(CommonDTO commonDto, MultipartFile drawFile) {
		
		if (commonDto != null) {
			File file = new File(this.pathOfInspectionFile, drawFile.getName());
			
			File forMkdir = new File(this.pathOfInspectionFile);
			
			if(!forMkdir.exists()) {
				forMkdir.mkdirs();
			}
			
			try {
				
				FileCopyUtils.copy(drawFile.getBytes(), file);
				
				commonDto.setDrawImage(drawFile.getOriginalFilename());
				
				cs.insertPart(commonDto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/part";
	}
}
