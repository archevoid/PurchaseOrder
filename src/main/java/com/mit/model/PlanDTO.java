package com.mit.model;


import lombok.Data;


@Data
public class PlanDTO {
	Long planNum;
	Long eplNum;
	Long productNum;
	Long quantity;
	java.sql.Date dueDate;
	Long currentQuantity;
	
	String productName;
	String partnerName;
	Long productPrice;
	
}
