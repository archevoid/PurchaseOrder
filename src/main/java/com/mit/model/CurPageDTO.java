package com.mit.model;

import lombok.Data;

@Data
public class CurPageDTO {
	private Long pageNum = 1L;
	private Long amount = 10L;
}
