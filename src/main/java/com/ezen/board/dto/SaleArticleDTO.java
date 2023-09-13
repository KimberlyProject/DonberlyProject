package com.ezen.board.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
@Component("saleArticleDTO")
public class SaleArticleDTO {
	private	int		rnum;
	private	int		level;
	private	int		articleNO;
	private	String	userId;
	private	Date	write_date;
	private	String	title;
	private String	content;
	private int		p_code;
	private int		purpose;
	private int		view;
	private	String	thumbnail;
	private int		price;
	private String	nickname;
	private String	email;
	
	

	//-----------------------------------------------------------------------------------------------------------
	public String getThumbnail() {
		try {
			if(thumbnail != null && thumbnail.length() != 0) {
				thumbnail = URLDecoder.decode(thumbnail, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return thumbnail;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 이미지 파일의 이름과 사이즈가 0이 아닌 경우에 저장한다.
	//-----------------------------------------------------------------------------------------------------------
	public void setThumbnail(String thumbnail) {
		try {
			if(thumbnail != null && thumbnail.length() != 0) {
				this.thumbnail = URLEncoder.encode(thumbnail, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getArticleNO() {
		return articleNO;
	}

	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getTitle() {
		return title.replaceAll("(?i)<script", "&lt;script");
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content.replaceAll("(?i)<script", "&lt;script");
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getPurpose() {
		return purpose;
	}

	public void setPurpose(int purpose) {
		this.purpose = purpose;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "SaleArticleDTO [rnum=" + rnum + ", level=" + level + ", articleNO=" + articleNO + ", userId=" + userId
				+ ", write_date=" + write_date + ", title=" + title + ", content=" + content + ", p_code=" + p_code
				+ ", purpose=" + purpose + ", view=" + view + ", thumbnail=" + thumbnail + ", price=" + price
				+ ", nickname=" + nickname + ", email=" + email + "]";
	}

	
	
	
} // End - public class ArticleV
