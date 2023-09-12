package com.ezen.auction.dto;

import java.sql.Date;

public class AucImgDTO {

	private int imgNo;
	private String imgName;
	private int aucCode;
	
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public int getAucCode() {
		return aucCode;
	}
	public void setAucCode(int aucCode) {
		this.aucCode = aucCode;
	}
	@Override
	public String toString() {
		return "AucImgDTO [imgNo=" + imgNo + ", imgName=" + imgName + ", aucCode=" + aucCode
				+ "]";
	}
	
	
	
	
}
