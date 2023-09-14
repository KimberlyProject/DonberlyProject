package com.ezen.auction.service;

import java.util.List;



import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ezen.auction.dao.AuctionDAO;
import com.ezen.auction.dto.AucImgDTO;
import com.ezen.auction.dto.AuctionDTO;
import com.ezen.auction.dto.SearchCriteria;

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
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//전체 게시글 수 구하기(paging)
	public int auctionTotalCount(SearchCriteria cri) throws Exception {
		return auctionDAO.auctionTotalCount(cri);
	}
	//게시글 목록 가져오기(paging)
	public List<AuctionDTO> auctionPaging(SearchCriteria cri) throws Exception {
		return auctionDAO.auctionPaging(cri);
	}
	//이미지 목록 가져오기(paging)
	public List<AucImgDTO> auctionPagingImg(int aucCode) throws Exception {
		return auctionDAO.auctionPagingImg(aucCode);
	}
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//마이페이지 MyAuction 게시글 가져오기
	public List<AuctionDTO> myauctionArticles(String aucId) throws Exception {
		List<AuctionDTO> articles = auctionDAO.myauctionArticles(aucId);
		return articles;
	}
	
	//마이페이지 MyBid 게시글 가져오기
	public List<AuctionDTO> mybidArticles(String cstmId) throws Exception {
		List<AuctionDTO> articles = auctionDAO.mybidArticles(cstmId);
		return articles;
	}
	
	//마이페이지 image 가져오기
	public List<AucImgDTO> mypageImg(int aucCode) throws Exception {
		List<AucImgDTO> imgs = auctionDAO.mypageImg(aucCode);
		return imgs;
	}
}
