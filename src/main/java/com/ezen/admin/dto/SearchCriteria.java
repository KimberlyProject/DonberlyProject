package com.ezen.admin.dto;

public class SearchCriteria extends Criteria {
	private	String	searchType;	// 검색 타입 : 전체(a), 아이디(i), 연락처(t), 주소(addr), 가입일자(d)
	private	String	keyword;	// 검색키워드 : 검색할 내용
	
	// getters and setters
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
	
	// to String
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
