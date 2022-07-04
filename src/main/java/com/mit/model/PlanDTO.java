package com.mit.model;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class PlanDTO {
	Long supportNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	Date deliveryDate;
	Long requirement;
	Long partCode;
	String partName;
	
	/* TBL_Contract */
	Long contractNo;
	Long unitPrice;
	String code;
}
