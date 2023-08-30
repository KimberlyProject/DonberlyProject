package com.ezen.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.board.dto.SaleArticleVO;

//-----------------------------------------------------------------------------------------------------------
// 게시글 
//-----------------------------------------------------------------------------------------------------------
public interface BoardDAO {

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	public List selectAllArticlesList() throws DataAccessException;
	
	public List saleSelectAllArticlesList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 쓰기
	//-----------------------------------------------------------------------------------------------------------
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	
	public int saleInsertNewArticle(Map articleMap) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	
	public SaleArticleVO saleSelectArticle(int articleNO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	public void deleteArticle(int articleNO) throws DataAccessException;
	
	public void saleDeleteArticle(int articleNO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 정보수정하기
	//-----------------------------------------------------------------------------------------------------------
	public void updateArticle(Map articleMap) throws DataAccessException;
	
	public void saleUpdateArticle(Map articleMap) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int boardListTotalCount(SearchCriteria cri) throws DataAccessException;
	
	public int saleBoardListTotalCount(SearchCriteria cri) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	public List<ArticleVO> boardListPaging(SearchCriteria cri) throws DataAccessException;
	
	public List<SaleArticleVO> saleBoardListPaging(SearchCriteria cri) throws DataAccessException;
	
} // End - public interface BoardDAO
