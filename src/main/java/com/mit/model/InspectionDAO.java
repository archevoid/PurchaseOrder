package com.mit.model;

import java.util.List;

public interface InspectionDAO {
	public List<OrderDTO> getNotFinishedOrder();
	
	public List<InspectionDTO> getInspectionByOrderNum(InspectionDTO inspectionDto);
}
