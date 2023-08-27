package com.ezen.member.dto;

import java.sql.Date;


public class MemberDTO {

	private String userId;
	private String pw;
	private String repw;
	private String name;
	private String nickname;
	private Date regDate;
	private String tel;
	private String email;
	private String address;
	private String zipCode;
	
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
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
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
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", pw=" + pw + ", repw=" + repw + ", name=" + name + ", nickname="
				+ nickname + ", regDate=" + regDate + ", tel=" + tel + ", email=" + email + ", address=" + address
				+ ", zipCode=" + zipCode + "]";
	}
	
	
	
	
}
