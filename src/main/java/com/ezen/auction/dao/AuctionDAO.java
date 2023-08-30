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
	
	//새로운 게시글 추가하기
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int aucCode = selectNewAucCode();
		articleMap.put("aucCode", aucCode);
		sqlSession.insert(namespace + ".insertNewArticle", articleMap);
		return aucCode;
	}		//aucCode 생성하기
			private int selectNewAucCode() throws DataAccessException {
				return sqlSession.selectOne(namespace +".selectNewAucCode");
			}
	//새로운 게시글 이미지 추가하기
	public void insertNewImg(Map articleMap) throws DataAccessException {
		List<AucImgDTO> imgFileList = (ArrayList)articleMap.get("imgFileList");
		int aucCode = (Integer)articleMap.get("aucCode");
		int imgFileNo = selectNewImgFileNo();
		for(AucImgDTO aucImgDTO : imgFileList) {
			aucImgDTO.setImgNo(++imgFileNo);
			aucImgDTO.setAucCode(aucCode);
		}		
		sqlSession.insert(namespace + ".insertNewImg", articleMap);
	}		//이미지 번호 추출		
			private int selectNewImgFileNo() throws DataAccessException {
				return sqlSession.selectOne(namespace + ".selectNewImgFileNo");
			}
	
	
	//메인페이지 게시글 불러오기
	public List selectAllArticlesList() throws DataAccessException {
		System.out.println("경메장 메인페이지 dao");
		List<AuctionDTO> articlesList = sqlSession.selectList(namespace + ".pullArticleInfo");
		System.out.println("디비야 메인에올라갈 정보내놔" + articlesList);
		return articlesList;
	}
	
	//메인페이지 image 불러오기
	public List selectAllArticleListImg() throws DataAccessException {
		System.out.println("경매장 메인 image dao");
		List<AucImgDTO> articlesList = sqlSession.selectList(namespace + ".pullArticleImg");
		System.out.println("디비야 메인에올라갈 이미지 정보내놔" + articlesList);
		return articlesList;
	}
	
	//디테일 페이지 게시글 불러오기
	public AuctionDTO selectArticle(int aucCode) throws DataAccessException {
		System.out.println("경매 디테일 dao");
		return sqlSession.selectOne(namespace + ".pullArticleInfoDetail", aucCode);
	}
	
	//디테일 페이지 image 불러오기
	public AucImgDTO selectArticleImg(int aucCode) throws DataAccessException {
		System.out.println("경매 디테일 image dao");
		return sqlSession.selectOne(namespace + ".pullArticleImgDetail", aucCode);
	}
	
}//class
