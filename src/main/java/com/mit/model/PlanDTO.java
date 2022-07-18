package com.mit.model;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class PlanDTO {
	// planNum: support_num or supportNo를 위한 변수
	private String partCode;
	
	/* TBL_Contract */
	private Long contractNo;
	private Long unitPrice;
	private String companyCode;
	
	private Long contractNum;
	
	
	/**/
	private CurPageDTO curPageDto;
	
	
	private String planNum;
	private Long requirement;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date dueDate;
	private String partName;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date initialDueDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date finalDueDate;
	
	private Long sum;
	
	
	/* 대분류 중분류 추가 */
}
