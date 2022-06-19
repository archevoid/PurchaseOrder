package com.mit.model;


import java.sql.Date;

import lombok.Data;


@Data
public class PlanDTO {
	Long planNum;
	Long eplNum;
	Long productNum;
	Long quantity;
	Date dueDate;
	
	/* progress 테이블 */
	Long currentQuantity;
	
	/* product 테이블 */
	String productName;
	Long productPrice;
	
	/* partner 테이블 */
	String ptnName;
	
}
