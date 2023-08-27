package com.ezen.board.dto;

//-----------------------------------------------------------------------------------------------------------
// public class PageMaker
//-----------------------------------------------------------------------------------------------------------
public class PageMaker {
	
	//private	Criteria	cri;
	private	SearchCriteria	cri;
	private	int			totalCount;				// 전체 페이지 개수
	private	int			startPage;				// 현재 화면에서 보이는 startPage 번호
	private	int			endPage;				// 현재 화면에서 보이는 endPage 번호
	private	boolean		prev;					// 페이징 이전 버튼 활성화 여부
	private	boolean		next;					// 페이징 다음 버튼 활성화 여부
	private	int			displayPageNum = 3;		// 화면 하단에 보여줄 페이지의 개수 (1,2,3,4,5,6,7,8,9,10)
	
	public SearchCriteria getCri() {
		return cri;
	}
	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calculatePages();
	}
	//-----------------------------------------------------------------------------------------------------------
	// 화면 하단에 보여줄 페이지를 계산한다.
	//-----------------------------------------------------------------------------------------------------------
	private void calculatePages() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		startPage	= (endPage - displayPageNum) + 1;
		if(startPage <= 0)	startPage = 1;
		
		// 보여줄 총 페이지 건수를 계산한다.
		int realEndPage	= (int) (Math.ceil(totalCount / (double)cri.getPerPageNum())); 
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		// 이전 페이지 (prev) : startPage가 1이 아닌 경우에만 활성화시킨다.
		prev = startPage == 1 ? false : true;
		
		// 다음 페이지 (next)
		next = endPage * cri.getPerPageNum() < totalCount ? true : false;
		
	} // End - 화면 하단에 보여줄 페이지를 계산한다
	
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + "]";
	}
	
} // End - public class PageMaker
