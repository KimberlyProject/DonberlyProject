package com.ezen.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.info.dao.InfosDAO;



@Service("infosService")
public class InfosService {

	@Autowired
	InfosDAO infosDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int infosListTotalCount(SearchCriteria cri) throws Exception {
		return infosDAO.infosListTotalCount(cri);
	}
	
	public List<ArticleVO> infosListPaging(SearchCriteria cri) throws Exception {
		return infosDAO.infosListPaging(cri);
	}
	
	
	
	
	
}
