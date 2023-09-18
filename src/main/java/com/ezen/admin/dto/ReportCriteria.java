package com.ezen.admin.dto;

public class ReportCriteria {
	private int page;			// 현재 페이지 번호
	private int perPageNum;		// 한 페이지당 보여줄 글의 개수
	
	// 현재 페이지의 시작 글 번호
	public int getPageStart() {
		return(this.page -1) - perPageNum;
	}
	
	// 기존생성자
	public ReportCriteria() {
		// 최초 게시판에 진입할 때를 위해서 기본값을 설정해야 한다.
		this.page		= 1;	// 현재 페이지 번호
		this.perPageNum	= 3;	// 한 페이지당 보여줄 글의 개수
	}
	
	// getters and setters
	public int getPage() {
		return page;
	}
	// 페이지가 음수 값이 되지 않게 설정. 음수가 되면 1page를 나타낸다.
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
	// 페이지당 보여줄 게시글 수가 변하지 않게 설정한다.
	public void setPerPageNum(int pageCount) {
		int OriginalCnt = this.perPageNum;
		
		if(pageCount != OriginalCnt) {
			this.perPageNum = OriginalCnt;
		} else {
			this.perPageNum = perPageNum;			
		}
	}
	
	// to String
	@Override
	public String toString() {
		return "ReportCriteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
