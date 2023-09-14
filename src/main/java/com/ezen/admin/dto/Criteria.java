package com.ezen.admin.dto;


// public class Criteria
public class Criteria {
	private int page;		// 현재 페이지 번호
	private int perPageNum;	// 한 페이지당 보여줄 글의 개수
	
	/*
	 * 게시글이 0으로 시작할 경우
	 * 현재 페이지의 게시글 시작번호 = (현재페이지번호 -1 * 페이지당 보여줄 게시글의 개수)
	 * 
	 * 현재 페이지 번호		페이지당 보여줄 게시글 수		계산식		게시글 시작 행 번호
	 * 			3						5				  (3-1) * 5				10
	 * 			8						7				  (8-1) * 7				49
	 * 			14						10				  (14-1) * 10			130
	 */
	
	// 현재 페이지의 시작 글 번호
	public int getPageStart() {
		return(this.page -1) - perPageNum;
	}
	
	// 기존 생성자
	public Criteria() {
		// 최초 게시판에 진입할 때를 위해서 기본값을 설정해야한다.
		this.page = 1;			// 현재 페이지 번호
		this.perPageNum = 5;	// 한 페이지당 보여줄 글의 개수
	}
	
	//getters and setters
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
	// 페이지당 보여줄 게시들 수가 변하지 않게 설정한다.
	public void setPerPageNum(int pageCount) {
		int OriginalCnt = this.perPageNum;
		
		if(pageCount != OriginalCnt) {
			this.perPageNum = OriginalCnt;
		} else {
			this.perPageNum = pageCount;			
		}
	}
	
	// toString
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
