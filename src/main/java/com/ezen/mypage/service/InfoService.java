package com.ezen.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.mypage.dao.InfoDAO;
import com.ezen.mypage.dto.MarketInfo;



@Service("infoService")
public class InfoService {

	@Autowired
	InfoDAO infoDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int infoListTotalCount(int i, MarketInfo market) throws Exception {
		return infoDAO.infoListTotalCount(i, market);
	}
	
	
	public List<BuyArticleDTO> infoList(int i, MarketInfo market) throws Exception {
		return infoDAO.infoList(i, market);
	}
	
	
}
