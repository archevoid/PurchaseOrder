package com.mit.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mit.model.InspectionDTO;
import com.mit.service.ExcelService;
import com.mit.service.InspectionService;

import lombok.AllArgsConstructor;

@RequestMapping("/file")
@AllArgsConstructor
@RestController
public class FileController {
	
	InspectionService is;
	ExcelService es;
	
	@GetMapping("inspectionSchedule")
	public String getInspectionScheduleExcel(InspectionDTO inspectionDto, HttpServletResponse response) {
		List<InspectionDTO> valueList = is.getInspectionByOrderNum(inspectionDto);
		
		HashMap<String, InspectionDTO> valueMap = new HashMap<String, InspectionDTO>();
		String[] order = new String[] {
			"orderNum", "inspectionNum", "inspectionDate", "partName", "orderQuantity", "inspectionQuantity", "sampleQuantity", "emplName", "email"
		};
		
		String[] header = new String[] {
			"발주번호", "검수번호", "검수일자", "품목", "발주수량", "검수수량", "샘플수량", "담당자", "이메일"
		};
		
		int key = 0;
		
		for (InspectionDTO dto : valueList) {
			valueMap.put(key++ + "", dto);
		}
		
		String sheetName = "Order_Number_" + inspectionDto.getOrderNum() + "_Inspection_Schedule";
		
		Workbook result = null;
		
		try {
			result = es.makeWorkBook(sheetName, valueMap, header, order);
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String fileName = sheetName;
		
		List<String> selected = inspectionDto.getInspectionNumList();
		
		for(String num : selected) {
			fileName += "_" + num;
		}
		
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
			OutputStream out = response.getOutputStream();
			result.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	
	@GetMapping("inspectionResult")
	public String getInspectionResultExcel(InspectionDTO inspectionDto, HttpServletResponse response) {
		InspectionDTO valueList = is.getInspectionResult(inspectionDto);
		
		HashMap<String, InspectionDTO> valueMap = new HashMap<String, InspectionDTO>();
		String[] order = new String[] {
			"orderNum", "inspectionNum", "inspectionDefect", "complement"
		};
		
		String[] header = new String[] {
			"발주번호", "검수번호", "불량수량", "보완사항"
		};
		
		valueMap.put(0 + "", valueList);
		
		String sheetName = "Order_Number_" + inspectionDto.getOrderNum() + "_Inspection_Result";
		
		Workbook result = null;
		
		try {
			result = es.makeWorkBook(sheetName, valueMap, header, order);
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String fileName = sheetName;
		
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
			OutputStream out = response.getOutputStream();
			result.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
