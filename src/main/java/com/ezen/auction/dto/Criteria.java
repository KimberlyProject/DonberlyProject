package com.ezen.auction.dto;

//-----------------------------------------------------------------------------------------------------------
// public class Criteria
//-----------------------------------------------------------------------------------------------------------
public class Criteria {

	private	int	page;		// 현재 페이지 번호
	private	int	perPageNum;	// 한 페이지당 보여줄 글의 갯수
	

	//현재페이지
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	public Criteria() {
		this.page		= 1;
		this.perPageNum	= 5;
	}
	
	public int getPage() {
		return page;
	}
	
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	
	
	public void setPerPageNum(int pageCount) {
		int OriginalCnt = this.perPageNum;
		
		if(pageCount != OriginalCnt) {
			this.perPageNum	= OriginalCnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
} // End - public class Criteria
