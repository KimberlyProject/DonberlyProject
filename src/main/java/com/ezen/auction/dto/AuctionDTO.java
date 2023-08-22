package com.ezen.auction.dto;

import java.sql.Date;

public class AuctionDTO {

	private String aucCode;
	private int minPrice;
	private int maxPrice;
	private Date aucWriteDate;
	private String aucImg;
	private String aucTitle;
	private String aucContent;
	private int nowPrice;
	private Date deadline;
	private String aucUserId;
	private String replyCode;
	private String pImageNo;
	public String getAucCode() {
		return aucCode;
	}
	public void setAucCode(String aucCode) {
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
	public Date getAucWriteDate() {
		return aucWriteDate;
	}
	public void setAucWriteDate(Date aucWriteDate) {
		this.aucWriteDate = aucWriteDate;
	}
	public String getAucImg() {
		return aucImg;
	}
	public void setAucImg(String aucImg) {
		this.aucImg = aucImg;
	}
	public String getAucTitle() {
		return aucTitle;
	}
	public void setAucTitle(String aucTitle) {
		this.aucTitle = aucTitle;
	}
	public String getAucContent() {
		return aucContent;
	}
	public void setAucContent(String aucContent) {
		this.aucContent = aucContent;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getAucUserId() {
		return aucUserId;
	}
	public void setAucUserId(String aucUserId) {
		this.aucUserId = aucUserId;
	}
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}
	public String getpImageNo() {
		return pImageNo;
	}
	public void setpImageNo(String pImageNo) {
		this.pImageNo = pImageNo;
	}
	@Override
	public String toString() {
		return "auctionDTO [aucCode=" + aucCode + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice
				+ ", aucWriteDate=" + aucWriteDate + ", aucImg=" + aucImg + ", aucTitle=" + aucTitle + ", aucContent="
				+ aucContent + ", nowPrice=" + nowPrice + ", deadline=" + deadline + ", aucUserId=" + aucUserId
				+ ", replyCode=" + replyCode + ", pImageNo=" + pImageNo + "]";
	}
	
	
	
}//auctionDTO
