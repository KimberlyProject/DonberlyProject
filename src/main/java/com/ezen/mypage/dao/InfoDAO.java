package com.ezen.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.SearchCriteria;

@Repository("infoDAO")
public class InfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.board.mappers.infoMapper";
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int infoListTotalCount(SearchCriteria cri, int i) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".infoListTotalCount"+ i, cri);
	}
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	public List<ArticleVO> infoListPaging(SearchCriteria cri, int i) throws DataAccessException {
		return sqlSession.selectList(namespace + ".infoListPaging"+ i, cri);
	}
	
}
