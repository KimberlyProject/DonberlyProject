package com.ezen.mypage.dto;

import java.sql.Date;

public class CalendarDTO {
	private String userId;
	private int articleId;
	private Date schedule;
	private String status;
	private String contents;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public Date getSchedule() {
		return schedule;
	}
	public void setSchedule(Date schedule) {
		this.schedule = schedule;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "CalendarDTO [userId=" + userId + ", articleId=" + articleId + ", schedule=" + schedule + ", status="
				+ status + ", contents=" + contents + "]";
	}
	
}