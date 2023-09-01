package com.ezen.chat.dto;

public class ChatListDTO {
	private int chatId;	//채팅방 고유 넘버
	private int artNo;	//연결된 게시판 넘버
	private String seller;	//판매자 아이디
	private String buyer;	//구매자 아이디
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public int getArtNo() {
		return artNo;
	}
	public void setArtNo(int artNo) {
		this.artNo = artNo;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	@Override
	public String toString() {
		return "ChatListDTO [chatId=" + chatId + ", artNo=" + artNo + ", seller=" + seller + ", buyer=" + buyer + "]";
	}
	
	
}
