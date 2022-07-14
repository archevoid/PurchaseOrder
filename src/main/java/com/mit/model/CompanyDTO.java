package com.mit.model;


import java.sql.Date;

import lombok.Data;

@Data
public class CompanyDTO {
	private Long contractNum;
	private Long unitPrice;
	private String companyCode;
	private String companyName;
	private String contractCurrency;
	private String companyAccount;
	private String businessNum;
	
	/* getCompanyInfoByPartName() */
	private Byte existance;
	
	private String owner;
	private String contact;
	private String account; //
	private String currency;
	private String taxCode;
	private String companyAddress;
	private String companySize;
	private String companyCategory;
	private String companySales;
	private String dealType;
	private String domesticForeign;
	private Date startDate;
	private Date endDate;
	private String invoiceIssue;
	
	
	private String leadTime;
	private String transferCondition;
	
	private String comEmployee;
	private String comEmail;
}
