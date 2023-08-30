package com.ezen.board.dto;

//-----------------------------------------------------------------------------------------------------------
// public class SearchCriteria
//-----------------------------------------------------------------------------------------------------------
public class SearchCriteria extends Criteria {
	
	private	String	searchType;		// 검색 타입 : 제목(t), 내용(c), 글쓴이(w)
	private String	keyword;		// 검색 키워드 : 검색할 내용
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	

} // End - public class SearchCriteria
