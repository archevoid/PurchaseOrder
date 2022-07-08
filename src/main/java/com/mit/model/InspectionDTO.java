package com.mit.model;

import java.sql.Date;

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
	
	private Long insepectionDefect;
	private String complement;
}
