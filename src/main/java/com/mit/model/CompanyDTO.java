package com.mit.model;


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
}
