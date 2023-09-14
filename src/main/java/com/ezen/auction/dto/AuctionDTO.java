package com.ezen.auction.dto;

import java.sql.Date;

public class AuctionDTO {

	private int aucCode;
	private int minPrice;
	private int maxPrice;
	private Date writeDate;
	private String title;
	private String content; 
	private int nowBid; 
	private int bidRate; 
	private Date deadline;
	private int deadlineRate;
	private String aucId; 
	private String aucNick;
	private int status;
	private String cstmId;
	private String nickname;
	private String email;
	
	public String getCstmId() {
		return cstmId;
	}
	public String getAucNick() {
		return aucNick;
	}
	public void setAucNick(String aucNick) {
		this.aucNick = aucNick;
	}
	public void setCstmId(String cstmId) {
		this.cstmId = cstmId;
	}
	public int getAucCode() {
		return aucCode;
	}
	public void setAucCode(int aucCode) {
		this.aucCode = aucCode;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
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
	public int getNowBid() {
		return nowBid;
	}
	public void setNowBid(int nowBid) {
		this.nowBid = nowBid;
	}
	public int getBidRate() {
		return bidRate;
	}
	public void setBidRate(int bidRate) {
		this.bidRate = bidRate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getAucId() {
		return aucId;
	}
	public void setAucId(String aucId) {
		this.aucId = aucId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getDeadlineRate() {
		return deadlineRate;
	}
	public void setDeadlineRate(int deadlineRate) {
		this.deadlineRate = deadlineRate;
	}
	@Override
	public String toString() {
		return "AuctionDTO [aucCode=" + aucCode + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", writeDate="
				+ writeDate + ", title=" + title + ", content=" + content + ", nowBid=" + nowBid + ", bidRate="
				+ bidRate + ", deadline=" + deadline + ", deadlineRate=" + deadlineRate + ", aucId=" + aucId
				+ ", status=" + status + ", cstmId=" + cstmId + ", nickname=" + nickname + ", email=" + email + "]";
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}
