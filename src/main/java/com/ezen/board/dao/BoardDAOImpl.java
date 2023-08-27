package com.ezen.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.SaleArticleVO;
import com.ezen.board.dto.SearchCriteria;

//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.board.mappers.boardMapper";
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<ArticleVO> articlesList = sqlSession.selectList(namespace + ".selectAllArticleList");
		return articlesList;
	} // End - public List selectAllArticlesList()

	@Override
	public List saleSelectAllArticlesList() throws DataAccessException {
		List<SaleArticleVO> saleArticlesList = sqlSession.selectList(namespace + ".saleSelectAllArticleList");
		return saleArticlesList;
	}
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 쓰기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {

		int articleNO	= selectNewArticleNO();	// 새로 입력할 게시글의 번호를 가져온다.
		// int articleNO	= sqlSession.selectOne(namespace + ".selectNewArticleNO");	// 새로 입력할 게시글의 번호를 가져온다.
		System.out.println("새로운 게시글 번호 추출하기 : " + articleNO);
		
		int p_code	= selectNewPcode();
		articleMap.put("p_code", p_code);
		System.out.println("새로운 상품번호 추출하기 : " + p_code);
		
		
		articleMap.put("articleNO", articleNO);
		sqlSession.insert(namespace + ".insertNewArticle", articleMap);
		return articleNO;
	}
	
	@Override
	public int saleInsertNewArticle(Map articleMap) throws DataAccessException {

		int articleNO	= saleSelectNewArticleNO();	// 새로 입력할 게시글의 번호를 가져온다.
		// int articleNO	= sqlSession.selectOne(namespace + ".selectNewArticleNO");	// 새로 입력할 게시글의 번호를 가져온다.
		System.out.println("새로운 게시글 번호 추출하기 : " + articleNO);
		
		int p_code	= saleSelectNewPcode();
		articleMap.put("p_code", p_code);
		System.out.println("새로운 상품번호 추출하기 : " + p_code);
		
		
		articleMap.put("articleNO", articleNO);
		sqlSession.insert(namespace + ".saleInsertNewArticle", articleMap);
		return articleNO;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 게시글 번호 추출하기
	//-----------------------------------------------------------------------------------------------------------
	private int selectNewArticleNO() throws DataAccessException {
		
		return sqlSession.selectOne(namespace + ".selectNewArticleNO");
	}
	
	private int saleSelectNewArticleNO() throws DataAccessException {
		
		return sqlSession.selectOne(namespace + ".saleSelectNewArticleNO");
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 새로운 상품코드 번호 추출하기
	//-----------------------------------------------------------------------------------------------------------
	private int selectNewPcode() throws DataAccessException {
		
		return sqlSession.selectOne(namespace + ".selectNewPcode");
	}
	
	private int saleSelectNewPcode() throws DataAccessException {
		
		return sqlSession.selectOne(namespace + ".saleSelectNewPcode");
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".selectArticle", articleNO);
	}
	@Override
	public SaleArticleVO saleSelectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".saleSelectArticle", articleNO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete(namespace + ".deleteArticle", articleNO);
	}
	
	@Override
	public void saleDeleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete(namespace + ".saleDeleteArticle", articleNO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 정보수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update(namespace + ".updateArticle", articleMap);
	}
	
	@Override
	public void saleUpdateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update(namespace + ".saleupdateArticle", articleMap);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 구하기 (Paging 처리)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int boardListTotalCount(SearchCriteria cri) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".buyListTotalCount", cri);
	}
	
	@Override
	public int saleBoardListTotalCount(SearchCriteria cri) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".saleListTotalCount", cri);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기 (Paging)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ArticleVO> boardListPaging(SearchCriteria cri) throws DataAccessException {
		return sqlSession.selectList(namespace + ".boardListPaging", cri);
	}

	@Override
	public List<SaleArticleVO> saleBoardListPaging(SearchCriteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".saleBoardListPaging", cri);
	}


	
	

} // End - public class BoardDAOImpl implements BoardDAO
