package com.ezen.ccenter.dto;

import java.sql.Date;

public class CcenterDTO {

	private int articleNo;
	private String userId;
	private Date writeDate;
	private String title;
	private String content; 
	
	public int getArticleNo() {
		return articleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	
}
