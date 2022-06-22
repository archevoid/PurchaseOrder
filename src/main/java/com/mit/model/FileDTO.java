package com.mit.model;

import java.util.Date;

import lombok.Data;

@Data
public class FileDTO {
	
	Long planNum;
	Long ordinal;
	Long process;
	String savedName;
	String fileName;
	String fileFormat;
	Date inputDate;
	
	/* 쿼리 */
	Long maxOrdinal;
}
