package com.ezen.auction.service;

import java.util.List;


import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ezen.auction.dao.AuctionDAO;
import com.ezen.auction.dto.AucImgDTO;
import com.ezen.auction.dto.AuctionDTO;

@Service("AuctionService")
public class AuctionService {

	@Inject
	AuctionDAO auctionDAO;
	
	//글쓰기
	public int addNewArticle(Map articleMap) throws Exception{
		int aucCode = auctionDAO.insertNewArticle(articleMap);
		articleMap.put("aucCode", aucCode);
		auctionDAO.insertNewImg(articleMap);
		return aucCode;
	}

	
	//메인 게시글
	public List<AuctionDTO> listArticles() throws Exception {
		List<AuctionDTO> articlesList = auctionDAO.selectAllArticlesList();
		return articlesList;
	}
	
	//메인 image
	public List<AucImgDTO> listArticlesImg() throws Exception {
		List<AucImgDTO> articlesList = auctionDAO.selectAllArticleListImg();
		return articlesList;
	}
	
	//디테일 게시글
	public AuctionDTO viewArticle(int aucCode) throws Exception {
		AuctionDTO auctionDTO = auctionDAO.selectArticle(aucCode);
		return auctionDTO;
	}
	
	//디테일 
	public AucImgDTO viewArticleImg(int aucCode) throws Exception {
		AucImgDTO aucImgDTO = auctionDAO.selectArticleImg(aucCode);
		return aucImgDTO;
	}
}
