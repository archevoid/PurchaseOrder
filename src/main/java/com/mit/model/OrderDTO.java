package com.mit.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderDTO {
	private CurPageDTO curPageDto;
	
	
	private String contractNum;
	private String planNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date scheduledDate;
	private Long orderQuantity;
	private String emplNum;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date dueDate;
	
	private String partName;
	private String partCode;
	
	/* insertOrder() */
	private Long orderNum;
	
	/* getOrderByMonth() */
	private String companyName;
	private String companyCode;
	
	/* getCurrentOrder() */
	private String emplName;
	private String email;
	private Long unitPrice;
	
	/* getOrderInfo() */
	private String owner;
	private String contact;
	private String businessNumber;
	private String account;
	private String currency;
	
	/* getTotalPrice() */
	private Long totalPrice;
	private String contractCurrency;
	
	/* progress 데이터 검색 */
	private String supportNum;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date initialScheduledDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date finalScheduledDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date initialDueDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date finalDueDate;
	
	/* progress */
	private Long completeQuantity;
	
	
	private String leadTime;
	
	private Byte emergency;
	
	private String published;
	
	private Long sum;
	
	private String status;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date orderDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date initialOrderDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date finalOrderDate;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date today;
	
	private Boolean isActive;
	
	private String paperNum;
	
	private String comEmployee;
	private String comEmail;
}
