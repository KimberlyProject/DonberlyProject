package com.ezen.chat.dto;

import java.sql.Date;

public class ChatDTO {
	private String user_id;
	private String pw;
	private String name;
	private String nickname;
	private Date reg_date;
	private int tel;
	private String email;
	private String address;
	private String my_img;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
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
	public String getMy_img() {
		return my_img;
	}
	public void setMy_img(String my_img) {
		this.my_img = my_img;
	}
	@Override
	public String toString() {
		return "chatDTO [user_id=" + user_id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", reg_date=" + reg_date + ", tel=" + tel + ", email=" + email + ", address=" + address + ", my_img="
				+ my_img + "]";
	}
	
	
}
