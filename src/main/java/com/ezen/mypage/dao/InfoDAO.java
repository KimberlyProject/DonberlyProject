package com.ezen.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.mypage.controller.InfoController;
import com.ezen.mypage.dto.MarketInfo;

@Repository("infoDAO")
public class InfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.board.mappers.infoMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(InfoDAO.class);
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int infoListTotalCount(int i, MarketInfo market) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".infoListTotalCount"+ i, market);
	}
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------

	public List<BuyArticleDTO> infoList(int i, MarketInfo market) throws DataAccessException {
		
		logger.info(market.getUserId());
		
		if(i == 1) {
			return sqlSession.selectList(namespace + ".infoList"+ i, market);			
		}else {
			return sqlSession.selectList(namespace + ".infoList"+ i, market);
		}
	}
	
}
