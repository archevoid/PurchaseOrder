package com.mit.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderDTO {
	private String contractNum;
	private String planNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date orderDate;
	private Long orderQuantity;
	private String emplNum;
	
	private String partName;
	
	/* insertOrder() */
	private Long orderNum;
	
	/* getOrderByMonth() */
	private String companyName;
	private String companyCode;
	
	/* getCurrentOrder() */
	private String emplName;
	private String email;
	private Long unitPrice;
}
