package com.mit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.InspectionDAO;
import com.mit.model.InspectionDTO;
import com.mit.model.OrderDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class InspectionService extends com.mit.service.Service {
	
	InspectionDAO inspectionDao;
	
	
	public List<OrderDTO> getNotFinishedOrder() {
		return inspectionDao.getNotFinishedOrder();
	}
	
	public List<InspectionDTO> getInspectionByOrderNum(InspectionDTO inspectionDto) {
		return inspectionDao.getInspectionByOrderNum(inspectionDto);
	}
}
