package com.ezen.ccenter.dto;

import java.sql.Date;

public class ReportDTO {

	// 게시글 번호 
	private int articleNo;
	
	// 신고자 id 
	private String reporter;
	
	//신고대상 id
	private String reportedUser;
	
	// 작성 일자 
	private Date writeDate;
	
	// 신고 사유
	private String reason;
	
	// 게시글 내용
	private String content;

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getReportedUser() {
		return reportedUser;
	}

	public void setReportedUser(String reportedUser) {
		this.reportedUser = reportedUser;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReportDTO [articleNo=" + articleNo + ", reporter=" + reporter + ", reportedUser=" + reportedUser
				+ ", writeDate=" + writeDate + ", reason=" + reason + ", content=" + content + "]";
	}
	

	
	
	
	
	
	
	
}
