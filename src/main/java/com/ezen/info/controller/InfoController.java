package com.ezen.info.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.PageMaker;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.info.service.InfoService;
import com.ezen.info.service.InfosService;


@Controller("infoController")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\board\\article_image";
	
	@Autowired	
	private InfoService infoService;
	@Autowired	
	private InfosService infosService;
	@Inject		// Java에서 지원하는 어노테이션
	private ArticleVO artivleVO;
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 (페이징) 화면 보여주기 + 검색조건(SearchCriteria)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/myPage/marketInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri)
			throws Exception {

		String	viewName	= (String)request.getAttribute("viewName");
		ModelAndView	mav			= new ModelAndView(viewName);
		
		PageMaker 		pageMaker	= new PageMaker();
		pageMaker.setCri(cri);
		
		System.out.println("111111111111111111111111111111111");
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		// System.out.println("총 게시물 개수 : " + boardService.boardListTotalCount(cri));
		pageMaker.setTotalCount(infoService.infoListTotalCount(cri));
		logger.info("게시물의 총 건수 : " + pageMaker.getTotalCount());
		
		// 화면에 출력할 데이터를 가져온다.
		List<ArticleVO> list = infoService.infoListPaging(cri);
		System.out.println("리스트:" + list);
		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("###### PageMaker ==> " + pageMaker);
		
		mav.addObject("articlesList", 	list);   // >> list를 담아서 넘김
		mav.addObject("pageMaker",		pageMaker);
		mav.addObject("cri",			cri);
		
		//=======================================================================
		
		
		PageMaker 		pageMakers	= new PageMaker();
		pageMakers.setCri(cri);
		
		System.out.println("2222222222222222222222222222222222222");
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		// System.out.println("총 게시물 개수 : " + boardService.boardListTotalCount(cri));
		pageMakers.setTotalCount(infosService.infosListTotalCount(cri));
		logger.info("게시물의 총 건수 : " + pageMakers.getTotalCount());
		
		// 화면에 출력할 데이터를 가져온다.
		List<ArticleVO> lists = infosService.infosListPaging(cri);
		System.out.println("리스트:" + lists);
		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("###### PageMaker ==> " + pageMakers);
		
		mav.addObject("saleArticlesList", 	lists);   // >> list를 담아서 넘김
		mav.addObject("salePageMaker",		pageMakers);
		mav.addObject("cri",			cri);
		
		
		
		
		return mav;
		
	} // End - 게시글 목록 (페이징) 화면 보여주기 
	
	

	
	
}
