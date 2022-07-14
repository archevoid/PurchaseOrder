package com.mit.model;

import lombok.Data;

@Data
public class PageDTO {
	
	private CurPageDTO curPageDto;
	
	private Long totalAmount;
	
	private Long curFirstPage;
	private Long curLastPage;
	
	private Long lastPage;
	
	boolean isFirstPage;
	boolean isLastPage;
	
	private Long showPage = 5L;
	
	
	public PageDTO(CurPageDTO curPageDto, Long totalAmount) {
		this.curPageDto = curPageDto;
		
		this.lastPage = totalAmount % curPageDto.getAmount() == 0 ? totalAmount / curPageDto.getAmount() : totalAmount / curPageDto.getAmount() + 1L;
		
		this.curFirstPage = ((this.curPageDto.getPageNum() - 1L) / this.showPage) * this.showPage + 1L;
		
		this.curLastPage = this.curFirstPage + this.showPage - 1L;
		
//		if (this.curLastPage > this.lastPage) {
//			this.curLastPage = this.lastPage;
//		}
		
		this.isFirstPage = this.curPageDto.getPageNum() == 1L;
		
		this.isLastPage = this.curPageDto.getPageNum() == this.lastPage;
	}
}
