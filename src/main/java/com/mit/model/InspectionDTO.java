package com.mit.model;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InspectionDTO {
	private String orderNum;
	private String inspectionNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date inspectionDate;
	private Long inspectionQuantity;
	private Long sampleQuantity;
	
	private Long inspectionDefect;
	private String complement;
	private Byte close;
	
	/* 검수 일정 조회 */
	private String emplName;
	private String email;
	private String partName;
	private String orderQuantity;
	
	private String progress;

	/* 다운로드용 */
	private List<String> inspectionNumList;
}
