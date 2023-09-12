package com.ezen.ccenter.dto;

import java.sql.Date;

public class CcenterDTO {

	// 게시글 번호 
	private int articleNo;
	
	// 유저 id 
	private String userId;
	
	// 작성 일자 
	private Date writeDate;
	
	// 게시글 제목
	private String title;
	
	// 게시글 내용
	private String content;
	
	
	
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "CcenterDTO [articleNo=" + articleNo + ", userId=" + userId + ", writeDate=" + writeDate + ", title="
				+ title + ", content=" + content + "]";
	} 
	
	
	
}
