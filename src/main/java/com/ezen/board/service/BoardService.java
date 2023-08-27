package com.ezen.board.service;

import java.util.List;
import java.util.Map;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.board.dto.SaleArticleVO;
//-----------------------------------------------------------------------------------------------------------
// 게시글 
//-----------------------------------------------------------------------------------------------------------
public interface BoardService {

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	public List<ArticleVO> listArticles() throws Exception;
	
	public List<SaleArticleVO> saleListArticles() throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 쓰기
	//-----------------------------------------------------------------------------------------------------------
	public int addNewArticle(Map articleMap) throws Exception;
	
	public int saleAddNewArticle(Map articleMap) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	public ArticleVO viewArticle(int articleNO) throws Exception;
	
	public SaleArticleVO saleViewArticle(int articleNO) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	public void removeArticle(int articleNO) throws Exception;
	
	public void saleRemoveArticle(int articleNO) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 정보수정하기
	//-----------------------------------------------------------------------------------------------------------
	public void modArticle(Map articleMap) throws Exception;
	
	public void saleModArticle(Map articleMap) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	public int boardListTotalCount(SearchCriteria cri) throws Exception;

	public int saleBoardListTotalCount(SearchCriteria cri) throws Exception;
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	public List<ArticleVO> boardListPaging(SearchCriteria cri) throws Exception;
	
	public List<SaleArticleVO> saleBoardListPaging(SearchCriteria cri) throws Exception;
	
	
	

} // End - public interface BoardService









