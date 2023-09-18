package com.ezen.mypage.dto;

public class MarketInfo {

	private String userId;
	private int buycount;
	private int salecount;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getBuycount() {
		return buycount;
	}
	public void setBuycount(int buycount) {
		this.buycount = buycount;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	@Override
	public String toString() {
		return "MarketInfo [userId=" + userId + ", buycount=" + buycount + ", salecount=" + salecount + "]";
	}
	
	
	
	
}
