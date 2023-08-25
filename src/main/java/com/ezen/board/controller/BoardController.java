package com.ezen.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.SearchCriteria;

//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
public interface BoardController {

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView saleListArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 쓰기 화면
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView articleForm() throws Exception;
	
	public ModelAndView saleArticleForm() throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 쓰기 처리
	//-----------------------------------------------------------------------------------------------------------
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
		throws Exception;
	
	public ResponseEntity saleAddNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
									HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView saleViewArticle(@RequestParam("articleNO")int articleNO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity saleRemoveArticle(@RequestParam("articleNO") int articleNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity saleModArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 (페이징) 화면 보여주기 
	//-----------------------------------------------------------------------------------------------------------
	// public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response, Criteria cri) throws Exception;
	public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri) throws Exception;

	public ModelAndView saleListArticlesPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri) throws Exception;

	
	

	
} // End - public interface BoardController




