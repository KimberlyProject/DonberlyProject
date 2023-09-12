package com.ezen.board.dto;

//-----------------------------------------------------------------------------------------------------------
// public class Criteria
//-----------------------------------------------------------------------------------------------------------
public class Criteria {

	private	int	page;		// 현재 페이지 번호
	private	int	perPageNum;	// 한 페이지당 보여줄 글의 갯수
	
	/* 게시글이 0으로 시작할 경우
	 * 현재 페이지의 게시글 시작번호 = (현재 페이지 번호 -1) * 페이지당 보여줄 게시글의 개수 + 1
	 * 
	 * 현재 페이지 번호	페이지당 보여줄 게시글 수	계산식			게시글 시작 행 번호
	 * 3				5							(3-1) * 5  + 1	11
	 * 8				7							(8-1) * 7  + 1	49
	 * 14				10							(14-1)* 10 + 1	131
	 */
	
	// 현재 페이지의 시작 글 번호
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	// 기본 생성자
	public Criteria() {
		// 최초 게시판에 진입할 때를 위해서 기본 값을 설정해야 한다.
		this.page		= 1;
		this.perPageNum	= 9;
	}
	
	public int getPage() {
		return page;
	}
	// 페이지가 음수값이 되지 않게 설정. 음수가 되면 1페이지를 나타낸다.
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
