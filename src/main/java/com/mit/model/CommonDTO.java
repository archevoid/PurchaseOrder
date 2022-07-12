package com.mit.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CommonDTO {
	private String partCode;
	private String partName;
	private String partNickname;
	private String partClass; // 대분류, 중분류, 소분류
	private String partRemark;
	private String common; // 공용 0, 전용 1
	private String drawNum;
	private String drawImage;
	
	/* company */
	private String companyCode;
	private String companyName;
	private String contractCurrency;
	private String companyAccount;
	private String businessNum;
	
	
	private String owner;
	private String contact;
	private String account; //
	private String taxCode;
	private String companyAddress;
	private String companySize;
	private String companyCategory;
	private String companySales;
	private String dealType;
	private String domestic;
	private Date startDate;
	private Date endDate;
	private String invoiceIssue;
}
