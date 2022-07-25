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
	
	private Long scheduledNum;
	/**/
	private CurPageDTO curPageDto;
	
	
	private String planNum;
	private Long requirement;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date scheduledDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date expectedDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date dueDate;
	private String partName;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date initialDueDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date finalDueDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date today;
	
	private Long sum;
	
	private Long inputQuantity;
	
	private Long remainQuantity;
	
	private Boolean orderable;
	
}
