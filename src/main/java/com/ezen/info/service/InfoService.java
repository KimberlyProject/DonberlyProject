package com.ezen.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.info.dao.InfoDAO;



@Service("infoService")
public class InfoService {

	@Autowired
	InfoDAO infoDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int infoListTotalCount(SearchCriteria cri, int i) throws Exception {
		return infoDAO.infoListTotalCount(cri, i);
	}
	
	public List<ArticleVO> infoListPaging(SearchCriteria cri, int i) throws Exception {
		return infoDAO.infoListPaging(cri, i);
	}
	
	

	
	
}
