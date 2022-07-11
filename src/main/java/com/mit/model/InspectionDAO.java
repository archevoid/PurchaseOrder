package com.mit.model;

import java.util.List;

public interface InspectionDAO {
	public List<OrderDTO> getNotFinishedOrder();
	
	public List<InspectionDTO> getInspectionByOrderNum(InspectionDTO inspectionDto);
	
	public InspectionDTO getInspectionSchedule(InspectionDTO inspectionDto);
	
	public InspectionDTO getInspectionResult(InspectionDTO inspectionDto);
	
	public Integer insertInspectionSchedule(InspectionDTO inspectionDto);
	
	public Integer insertInspectionResult(InspectionDTO inspectionDto);
	
	public Integer getNextInspectionNum(InspectionDTO inspectionDto);
	
	public Integer getNextInspectionResultNum(InspectionDTO inspectionDto);
}
