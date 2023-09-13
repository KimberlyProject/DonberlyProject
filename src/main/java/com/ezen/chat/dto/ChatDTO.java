package com.ezen.chat.dto;

import java.sql.Date;

public class ChatDTO {
	private int chatId;
	private int artNo;
	private String fromId;
	private String ToId;
	private String chatContent;
	private Date chatTime;
	private int chatRead;
	
	
	public ChatDTO() {
		
	}
	public ChatDTO(String chatContent){
		this.setChatContent(chatContent);
	}
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
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getToId() {
		return ToId;
	}
	public void setToId(String toId) {
		ToId = toId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Date getChatTime() {
		return chatTime;
	}
	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}
	
	
	public int getChatRead() {
		return chatRead;
	}
	public void setChatRead(int chatRead) {
		this.chatRead = chatRead;
	}
	
	@Override
	public String toString() {
		return "ChatDTO [chatId=" + chatId + ", artNo=" + artNo + ", fromId=" + fromId + ", ToId=" + ToId
				+ ", chatContent=" + chatContent + ", chatTime=" + chatTime + ", chatRead=" + chatRead + "]";
	}
	
	
	
	
	
}
