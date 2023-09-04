package com.ezen.auction.dao;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.auction.dto.AucImgDTO;
import com.ezen.auction.dto.AuctionDTO;

@Repository
public class AuctionDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.auction.mappers.auctionMapper";
	
	//aucCode 생성하기
	private int selectNewAucCode() throws DataAccessException {
		return sqlSession.selectOne(namespace +".selectNewAucCode");
	}
	
	//새로운 게시글 추가하기
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		System.out.println("------------------------------------------게시글 업로드 dao----------------------------------------------------");
		int aucCode = selectNewAucCode();
		articleMap.put("aucCode", aucCode);
		System.out.println("dao에서 aucCode 생성" + aucCode);
		sqlSession.insert(namespace + ".insertNewArticle", articleMap);
		return aucCode;
	}		
			
	//이미지 번호 추출		
	private int selectNewImgFileNo() throws DataAccessException {
		System.out.println("------------------------------------------이미지 번호 추출 dao 메서드 실행------------------------------------------");
		return sqlSession.selectOne(namespace + ".selectNewImgFileNo");
	}
	
	//새로운 게시글 이미지 추가하기
	public void insertNewImg(Map articleMap) throws DataAccessException {
		System.out.println("------------------------------------------이미지추가 dao------------------------------------------");
		List<AucImgDTO> imgFileList = (ArrayList)articleMap.get("imgFileList");
		int aucCode = (Integer)articleMap.get("aucCode");
		int imgNo = selectNewImgFileNo();
		for(AucImgDTO aucImgDTO : imgFileList) {
			aucImgDTO.setImgNo(++imgNo);
			aucImgDTO.setAucCode(aucCode);
		}
		System.out.println("------------------------------------------그래서 번호 보여줌 articleMap " + articleMap + "------------------------------------------");
		System.out.println("------------------------------------------그래서 번호 보여줌 dao " + imgNo + "------------------------------------------");
		System.out.println("toString" + imgFileList.toString());
		sqlSession.insert(namespace + ".insertNewImg", imgFileList);
	}		
			
	//-------------------------------------------------------------------------------------------------------------//		
	
	//메인페이지 게시글 불러오기
	public List selectAllArticlesList() throws DataAccessException {
		System.out.println("------------------------------------------경메장 메인페이지 dao------------------------------------------");
		List<AuctionDTO> articlesList = sqlSession.selectList(namespace + ".pullArticleInfo");
		System.out.println("------------------------------------------디비야 메인에올라갈 정보내놔" + articlesList);
		return articlesList;
	}
	
	
	//이미지 최소값 불러오기 메서드
	private int selectMinImgNo() throws DataAccessException {
		System.out.println("------------------------------------------이미지 가장작은번호 추출 dao 메서드 실행------------------------------------------");
		return sqlSession.selectOne(namespace + ".selectMinImgNo");
	}
	
	//메인페이지 image 불러오기
	public AucImgDTO selectAllarticlesListImg() throws DataAccessException {
		System.out.println("------------------------------------------경매장 메인 최솟값으로 image dao------------------------------------------");
		int minImgNo = selectMinImgNo();
		return sqlSession.selectOne(namespace + ".pullArticleImg", minImgNo);
		
	}
	
//	//메인페이지 image 불러오기
//	public List selectAllArticleListImg() throws DataAccessException {
//		System.out.println("------------------------------------------경매장 메인 image dao------------------------------------------");
//		List<AucImgDTO> articlesList = sqlSession.selectList(namespace + ".pullArticleImg");
//		System.out.println("------------------------------------------디비야 메인에올라갈 이미지 정보내놔" + articlesList);
//		return articlesList;
//	}
	
	//디테일 페이지 게시글 불러오기
	public AuctionDTO selectArticle(int aucCode) throws DataAccessException {
		System.out.println("경매 디테일 dao");
		return sqlSession.selectOne(namespace + ".pullArticleInfoDetail", aucCode);
	}
	
	//디테일 페이지 image 불러오기
	public List selectArticleImg(int aucCode) throws DataAccessException {
		System.out.println("경매 디테일 image dao");
		List<AucImgDTO> articlesList = sqlSession.selectList(namespace + ".pullArticleImgDetail", aucCode);
		return articlesList;
	}

	//-------------------------------------------------------------------------------------------------------------//
	
	//판매자 경매종료하기
	public void deleteAuction(int aucCode) throws DataAccessException {
		System.out.println("------------------------------------------경메 취소 dao------------------------------------------");
		sqlSession.delete(namespace + ".auctionOff", aucCode);
	}
	
	//판매자 현재금액에 판매하기
	public void saleNow(Map articleMap) throws DataAccessException {
		System.out.println("------------------------------------------saleNow dao------------------------------------------");
		sqlSession.update(namespace + ".saleNow", articleMap);
	}
	
	//구매자 입찰하기
	public void tryBid(Map articleMap) throws DataAccessException {
		System.out.println("------------------------------------------tryBid dao------------------------------------------");
		sqlSession.update(namespace + ".tryBid", articleMap);
	}
	
	//구매자 상한가 구매하기
	public void buyNow(Map articleMap) throws DataAccessException {
		System.out.println("------------------------------------------buyNow dao------------------------------------------");
		sqlSession.update(namespace + ".buyNow", articleMap);
	}
	
}//class
