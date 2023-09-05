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

	//-------------------------------------------------------------------------------------------------------------//
	
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
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//디테일 게시글
	public AuctionDTO viewArticle(int aucCode) throws Exception {
		AuctionDTO auctionDTO = auctionDAO.selectArticle(aucCode);
		return auctionDTO;
	}
	
	//디테일 image
	public List<AucImgDTO> viewArticleImg(int aucCode) throws Exception {
		List<AucImgDTO> aucImgDTO = auctionDAO.selectArticleImg(aucCode);
		return aucImgDTO;
	}
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//판매자 경매종료
	public void removeAuction(int aucCode) throws Exception {
		auctionDAO.deleteAuction(aucCode);
	}
	
	//판매자 현재금액 판매
	public void saleNow(Map articleMap) throws Exception {
		auctionDAO.saleNow(articleMap);
	}
	
	//구매자 입찰하기
	public void tryBid(Map articleMap) throws Exception {
		auctionDAO.tryBid(articleMap);
	}
	
	//구매자 상한가로 구매하기
	public void buyNow(Map articleMap) throws Exception {
		auctionDAO.buyNow(articleMap);
	}
}
