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
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	
	public List<ArticleVO> listArticles() throws Exception {
		List<ArticleVO> articleList = boardDAO.selectAllArticlesList();
		return articleList;
	} // End - public List<ArticleVO> listArticles()
	
	
	public List<SaleArticleVO> saleListArticles() throws Exception {
		List<SaleArticleVO> saleArticleList = boardDAO.saleSelectAllArticlesList();
		return saleArticleList;
	}

	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 쓰기
	//-----------------------------------------------------------------------------------------------------------
	
	public int addNewArticle(Map articleMap) throws Exception {
		return boardDAO.insertNewArticle(articleMap);
	}
	
	
	public int saleAddNewArticle(Map articleMap) throws Exception {
		return boardDAO.saleInsertNewArticle(articleMap);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	
	public ArticleVO viewArticle(int articleNO) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}

	
	public SaleArticleVO saleViewArticle(int articleNO) throws Exception {
		SaleArticleVO SaleArticleVO = boardDAO.saleSelectArticle(articleNO);
		return SaleArticleVO;
	}
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}
	
	
	public void saleRemoveArticle(int articleNO) throws Exception {
		boardDAO.saleDeleteArticle(articleNO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 정보수정하기
	//-----------------------------------------------------------------------------------------------------------
	
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	
	public void saleModArticle(Map articleMap) throws Exception {
		boardDAO.saleUpdateArticle(articleMap);
	}	

	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	
	public int boardListTotalCount(SearchCriteria cri) throws Exception {
		return boardDAO.boardListTotalCount(cri);
	}
	
	
	public int saleBoardListTotalCount(SearchCriteria cri) throws Exception {
		return boardDAO.saleBoardListTotalCount(cri);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	
	public List<ArticleVO> boardListPaging(SearchCriteria cri) throws Exception {
		return boardDAO.boardListPaging(cri);
	}

	
	public List<SaleArticleVO> saleBoardListPaging(SearchCriteria cri) throws Exception {
		return boardDAO.saleBoardListPaging(cri);
	}



	public void buyNow(Map articleMap) throws Exception {
		boardDAO.buyNow(articleMap);
	}
	
	public void saleNow(Map articleMap) throws Exception {
		boardDAO.saleNow(articleMap);
	}
	
	
	
} // End - public class BoardServiceImpl implements BoardService



