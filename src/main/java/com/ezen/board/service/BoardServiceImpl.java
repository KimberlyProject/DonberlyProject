package com.ezen.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.board.dao.BoardDAO;
import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.SaleArticleVO;
import com.ezen.board.dto.SearchCriteria;

//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ArticleVO> listArticles() throws Exception {
		List<ArticleVO> articleList = boardDAO.selectAllArticlesList();
		return articleList;
	} // End - public List<ArticleVO> listArticles()
	
	@Override
	public List<SaleArticleVO> saleListArticles() throws Exception {
		List<SaleArticleVO> saleArticleList = boardDAO.saleSelectAllArticlesList();
		return saleArticleList;
	}

	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 쓰기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		return boardDAO.insertNewArticle(articleMap);
	}
	
	@Override
	public int saleAddNewArticle(Map articleMap) throws Exception {
		return boardDAO.saleInsertNewArticle(articleMap);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}

	@Override
	public SaleArticleVO saleViewArticle(int articleNO) throws Exception {
		SaleArticleVO SaleArticleVO = boardDAO.saleSelectArticle(articleNO);
		return SaleArticleVO;
	}
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}
	
	@Override
	public void saleRemoveArticle(int articleNO) throws Exception {
		boardDAO.saleDeleteArticle(articleNO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 정보수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	@Override
	public void saleModArticle(Map articleMap) throws Exception {
		boardDAO.saleUpdateArticle(articleMap);
	}	

	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int boardListTotalCount(SearchCriteria cri) throws Exception {
		return boardDAO.boardListTotalCount(cri);
	}
	
	@Override
	public int saleBoardListTotalCount(SearchCriteria cri) throws Exception {
		return boardDAO.saleBoardListTotalCount(cri);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ArticleVO> boardListPaging(SearchCriteria cri) throws Exception {
		return boardDAO.boardListPaging(cri);
	}

	@Override
	public List<SaleArticleVO> saleBoardListPaging(SearchCriteria cri) throws Exception {
		return boardDAO.saleBoardListPaging(cri);
	}




	
	
	
} // End - public class BoardServiceImpl implements BoardService



