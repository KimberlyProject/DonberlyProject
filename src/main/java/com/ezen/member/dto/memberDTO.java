package com.ezen.member.dto;

import java.sql.Date; //sysdate를 위한

public class memberDTO {

	private String userId;
	private String pw;
	private String name;
	private String nickname;
	private Date regDate;
	private String tel;
	private String email;
	private String address;
	private String myImg;
	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getMyImg() {
		return myImg;
	}


	public void setMyImg(String myImg) {
		this.myImg = myImg;
	}


	@Override
	public String toString() {
		return "memberDTO [userId=" + userId + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", regDate="
				+ regDate + ", tel=" + tel + ", email=" + email + ", address=" + address + ", myImg=" + myImg + "]";
	}
	
	
	
	
	
	
	
}//memberDTO
