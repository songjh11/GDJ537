package com.app.home.util;

import lombok.Data;

@Data
public class Pager {

	private Long page;
	private Long startNum;
	private Long lastNum;
	private Long startRow;
	private Long perPage;
	private Long perBlock;

	// 게시판 구분
	private String sort;

	//이전블럭의 유무 -이전블럭이 있으면 true 없으면 false
	private boolean pre;
	//다음블럭의 유무 -다음블럭이 있으면 true 없으면 false
	private boolean next;
	//검색 컬럼의 종류
	private String kind;
	//검색어
	private String search;
	//정렬
	private String order;

	public Pager() {
		this.perPage=10L;
		this.perBlock=5L;
	}

	//1. mapper에서 사용할 값 계산
	public void getRowNum()throws Exception {
		this.startRow = (this.getPage()-1)*this.getPerPage();
	}

	//2. Jsp에서 사용할 값 계산
	public void getNum(Long totalCount)throws Exception {
		//2. totalCount로 totalPage구하기
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() !=0) {
			totalPage++;
		}

		//2.1 totalPage보다 page가 더 클 경우
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}

		//3. totalPage로 totalBlock 구하기
		Long totalBlock = totalPage/this.getPerBlock();
		if(totalPage%this.getPerBlock() !=0) {
			totalBlock++;
		}

		//4. page로 curBlock 찾기
		Long curBlock = this.getPage()/this.getPerBlock();
		if(this.getPage()%this.getPerBlock() !=0) {
			curBlock++;
		}

		//5. curBlock으로 startnum lastnum 구하기
		this.startNum = (curBlock-1)*this.getPerBlock()+1;
		this.lastNum = curBlock*this.getPerBlock();

		//6. culBlock이 마지막block(total과 같을때)
		if(curBlock==totalBlock) {
			this.lastNum=totalPage;
		}

		if(totalPage == 0) {
			this.lastNum = 1L;
		}

		//7. 이전 다음 블럭의 유무
		if(curBlock>1) {
			pre=true;
		}

		if(curBlock<totalBlock) {
			next=true;
		}
	}


	public Long getPage() {
		if(this.page==null || this.page<1) {
			this.page=1L;
		}

		return page;
	}

	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}


	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}


}
