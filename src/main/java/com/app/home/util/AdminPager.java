package com.app.home.util;

import lombok.Data;

@Data
public class AdminPager {

	private Long startRow;
	private Long lastRow;
	private Long startnum;
	private Long lastnum;
	private Long page;
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
	

	//이전 블럭의 유무-이전 블럭이 있으면 true, 없으면 false
	private boolean pre;
	//다음 블럭의 유무-다음 블럭이 있으면 true, 없으면 false
	private boolean next;
		
	public AdminPager() {
		this.perPage=10L;
		this.perBlock=5L;
	}
	
	public void getRownum() throws Exception{
		this.startRow = (this.getPage()-1)*this.getPerPage();
	}
	
	public Long getPage() {
		if(this.page==null || this.page<1) {
			this.page=1L;
		}
		return page;
	}
	
	//jsp로 보내줄 페이지네이션 번호 계산
		public void getnum(Long totalCount) throws Exception{
			
			//totalPage 계산
			 Long totalPage = totalCount/this.getPerPage();
			 //totalCount에서 perPage 나눴을때 0이 아니라면 totalPage는 +1
			 //ex: totalCount:122 perPage:20 -> totalPage: 6+1 
			 if(totalCount%this.getPerPage()!=0) {
				 totalPage++;
			 }
			 
			 this.totalPage = totalPage;
			 
			 if(this.getPage()>totalPage) {
				 this.setPage(totalPage);
			 }
			 //totalBlock은 페이지네이션의 총 갯수
			 Long totalBlock = totalPage/this.getPerBlock();
			//totalPage를 PerBlock으로 나눴을때 0이 아니라면 totalBlock은 +1
			 //ex: totalPage:7 perPage:5 -> totalBlock: 1+1 
			 if(totalPage%this.getPerBlock()!=0) {
				 totalBlock++;
			 }
			 
			 //curBlock: 페이지네이션의 현재 번호
			 Long curBlock = this.getPage()/this.getPerBlock();
			 if(this.getPage()%this.getPerBlock()!=0) {
				 curBlock++;
			 }
			 		 
			 this.startnum = (curBlock-1)*this.getPerBlock()+1;
			 this.lastnum = curBlock*this.getPerBlock();
			 
			 if(curBlock==totalBlock) {
				 this.lastnum = totalPage;
			 }
			 
			 if(curBlock>1) {
					pre=true;
				}
				
			if(curBlock<totalBlock) {
					next=true;
				}
		}


}
