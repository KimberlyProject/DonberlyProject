package com.ezen.mypage.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.member.dto.MemberDTO;
import com.ezen.mypage.dto.PageMaker;
import com.ezen.mypage.dto.SearchCriteria;
import com.ezen.mypage.service.InfoService;



@Controller("infoController")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\board\\article_image";
	
	@Autowired	
	private InfoService infoService;
	@Autowired	
	private BuyArticleDTO artivleVO;
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 (페이징) 화면 보여주기 + 검색조건(SearchCriteria)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/mypage/marketInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response, 
			 								@RequestParam(value= "buycount", required=false) String buycount,
	 										@RequestParam(value= "salecount", required=false) String salecount)
											throws Exception {
		if(buycount == null) {
			buycount = "1";
		}if(salecount == null) {
			salecount = "1";
		}
		int isalecount = Integer.parseInt(salecount);
		int ibuycount = Integer.parseInt(buycount);
		
		//HttpSession session	= request.getSession();
		//MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		//String	userId = memberDTO.getUserId();
		
		
		//String	viewName	= (String)request.getAttribute("viewName");
		System.out.println("================================================================" + ibuycount + "==========================================");
		System.out.println("================================================================" + isalecount + "==========================================");
		ModelAndView	mav			= new ModelAndView();
		//PageMaker 		pageMaker	= new PageMaker();
		//pageMaker.setCri(cri);
		//System.out.println(cri);
		
		for(int i = 1; i <= 2; i++) {
			System.out.println("-------------반복문 테스트-----------------");
			// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
			// System.out.println("총 게시물 개수 : " + boardService.boardListTotalCount(cri));

			//System.out.println("==================================================================" + infoService.infoListTotalCount(cri, i));
			//pageMaker.setTotalCount(infoService.infoListTotalCount(cri, i));
			//logger.info("게시물의 총 건수 : " + pageMaker.getTotalCount());
			
			// 화면에 출력할 데이터를 가져온다.
			//List<BuyArticleDTO> list = infoService.infoListPaging(i);
			
			List<BuyArticleDTO> list = infoService.infoList(i, ibuycount, isalecount);			
			System.out.println("리스트:" + i + list);
			
			// pageMaker의 정보를 콘솔에 보여준다.
			//System.out.println("###### PageMaker ==> " + pageMaker);
			
			
			mav.addObject("articlesList" + i, 	list);   // >> list를 담아서 넘김
			//mav.addObject("pageMaker" + i ,		pageMaker);
			//mav.addObject("cri",			cri);
			
			
		}	
		mav.addObject("salecount", isalecount);   // >> list를 담아서 넘김
		mav.addObject("buycount", ibuycount);   // >> list를 담아서 넘김
		System.out.println("================================================================" + mav + "==========================================");

		return mav;
		
	} // End - 게시글 목록 (페이징) 화면 보여주기 
	
	

	
	
}
