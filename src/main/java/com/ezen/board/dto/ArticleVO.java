package com.ezen.board.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
@Component("articleVO")
public class ArticleVO {
	private	int		rnum;
	private	int		level;
	private	int		articleNO;
	private	String	user_id;
	private	Date	write_date;
	private	String	title;
	private String	content;
	private int		p_code;
	private int		purpose;
	private int		view;
	private	String	thumbnail;
	private int		price;
	
	

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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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

	@Override
	public String toString() {
		return "ArticleVO [rnum=" + rnum + ", level=" + level + ", articleNO=" + articleNO + ", user_id=" + user_id
				+ ", write_date=" + write_date + ", title=" + title + ", content=" + content + ", p_code=" + p_code
				+ ", purpose=" + purpose + ", view=" + view + ", thumbnail=" + thumbnail + ", price=" + price + "]";
	}

	
	
	
} // End - public class ArticleV
