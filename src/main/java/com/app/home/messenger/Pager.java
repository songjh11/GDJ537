package com.app.home.messenger;

import lombok.Data;

@Data
public class Pager {
	
	private Long page;
	private Long startnum;
	private Long lastnum;
	private Long startRow;
	private Long lastRow;
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
	
	private boolean pre;
	private boolean next;
	
	private String kind;
	private String search;
	
	
	// 1. 매퍼에 들어가는 startnum, lastnum을 자동으로 계산하는 getRownum 메서드
	public void getRownum()throws Exception{
		this.startRow = (this.getPage()-1)*this.getPerPage();
	}
	
	// 2. 각종 페이지수 계산 메서드 - totalCount는 매퍼에서 getCount생성 후 서비스에서 호출
	public void getnum(Long totalCount)throws Exception{
		//1. 전체글수(totalCount)로 (전체페이지수)totalPage 계산
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			totalPage +=1;
		}
		
		
		
		//cf)1-1. totalPage보다 page가 큰 경우 못가게 막기
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}
		
		
		if(this.getPage()==0L) {
			this.setPage(1L);
		}
		
		//2. totalPage를 이용해 totalBlock(페이지한묶음의 수)
		Long totalBlock = totalPage/this.getPerBlock();
		if(totalPage%this.getPerBlock()!=0) {
			totalBlock +=1;
		}
		//3. page로 현재나의페이지블럭위치(curBlock) 구하기
		Long curBlock = this.getPage()/this.getPerBlock();
		if(this.getPage()%this.getPerBlock()!=0) {
			curBlock +=1;
		}
		
		//4. curBlock으로 페이지의 시작번호랑 끝번호 계산
		this.startnum = (curBlock-1)*this.getPerBlock()+1;
		this.lastnum = curBlock*this.getPerBlock();

		//5. 현재내가있는블럭이 토탈블락의 끝일때 (라스트넘이 전체페이지수보다 많아짐 방지)
		if(curBlock==totalBlock) {
			this.lastnum=totalPage;
		}
		
		//?? 검색결과가 0개면 라스트넘도 0이 되는 식 (제가 임의로 추가한거라 에러뜨면 사용x)
		if(totalBlock==0) {
			//this.lastnum=totalPage;
			
			this.lastnum=0L;
		}
		
		//6.이전, 다음 블럭의 유무
		if(curBlock>1) {
			pre=true;
		}
		
		if(curBlock<totalBlock) {
			next=true;
		}
	}
	
	public Long getPage() {
		if(this.page==null||this.page<1) {
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
	
	public Long getPerBlock() {
		if(this.perBlock==null) {
			this.perBlock=10L;
		}
		
		return perBlock;
	}
	
	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}
	
	public String getKind() {
		if(this.kind==null) {
			this.kind="";
		}
		return kind;
	}
	


}
