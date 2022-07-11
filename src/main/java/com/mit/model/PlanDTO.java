package com.mit.model;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class PlanDTO {
	// planNum: support_num or supportNo를 위한 변수
	private String planNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date deliveryDate;
	private Long requirement;
	private Long partCode;
	private String partName;
	
	/* TBL_Contract */
	private Long contractNo;
	private Long unitPrice;
	private String companyCode;
	
	private Long contractNum;
}
