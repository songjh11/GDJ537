package com.app.home.report.util;

import lombok.Data;

@Data
public class ReportPager {
	private Long page;
	private Long startnum;
	private Long lastnum;
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
	private Long startRow;
	
	private boolean pre;
	private boolean next;
	
	private String kind;
	private String search;
	
	private int id;
	
	public String getSearch() {
		if(this.search == null) {
			this.search = "";
		}
		return search;
	}
	
	public ReportPager() {
		this.perPage = 10L;
		this.perBlock = 5L;
	}
	
	public Long getPage() {
		if(this.page == null || this.page <=0) {
			this.page = 1L;
		}
		return page;
	}
	
	//mapper용 스타트로우
	public Long getStartRow() {
		this.startRow = (this.getPage()-1)*this.getPerPage();
		return startRow;
	}
	
	//jsp 에서 쓸 startnum
	public void getnum(Long totalCount) throws Exception{
		//1. 받은 totalCount로 전체 페이지 구하기
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0) {
			totalPage++;
		}
		
		this.totalPage = totalPage;
		
		//2. 전체 페이지로 전체 블럭 구하기
		Long totalBlock = totalPage/this.getPerBlock();
		if(totalPage%this.getPerBlock() != 0) {
			totalBlock++;
		}
		
		//3. page 번호로 현재 블럭의 번호 구하기
		Long curBlock = this.getPage()/this.getPerBlock();
		if(this.getPage()%this.getPerBlock() != 0) {
			curBlock++;
		}
		
		//4. Curblock으로 시작번호 및 끝번호
		this.startnum = (curBlock-1)*this.getPerBlock()+1;
		this.lastnum = curBlock*this.getPerBlock();
		
		if(curBlock == totalBlock) {
			this.lastnum = totalPage;
		}
		
		if(curBlock > 1) {
			pre = true;
		}
		
		if(curBlock<totalBlock) {
			next = true;
		}
	}
}
