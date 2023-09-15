package com.ezen.mypage.dto;

import java.sql.Date;

public class CalendarDTO {
	private int calendarId;
	private String userId;
	private int articleId;
	private String schedule;
	private String status;
	private String contents;
	
	public int getCalendarId() {
		return calendarId;
	}
	public void setCalendarId(int calendarId) {
		this.calendarId = calendarId;
	}
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
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
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
		return "CalendarDTO [calendarId=" + calendarId + ", userId=" + userId + ", articleId=" + articleId
				+ ", schedule=" + schedule + ", status=" + status + ", contents=" + contents + "]";
	}
		
	
}