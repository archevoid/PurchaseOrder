package com.mit.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private String contractNum;
	private String planNum;
	private Date orderDate;
	private Long orderQuantity;
	private String emplNum;
	
	private String partName;
	
	/* insertOrder() */
	private Long orderNum;
}
