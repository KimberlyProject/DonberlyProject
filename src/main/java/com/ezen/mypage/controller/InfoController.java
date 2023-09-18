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
import org.springframework.web.servlet.ModelAndView;

import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.member.dto.MemberDTO;
import com.ezen.mypage.service.InfoService;
import com.ezen.mypage.dto.MarketInfo;


@Controller("infoController")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\workspace\\DonberlyProject\\src\\main\\webapp\\resources\\images\\board\\article_image";
	
	@Autowired	
	private InfoService infoService;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 (페이징) 화면 보여주기 + 검색조건(SearchCriteria)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/mypage/marketInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response,
											@RequestParam(value="buycount", required=false, defaultValue="1") String buycount, 
											@RequestParam(value="salecount", required=false, defaultValue="1") String salecount)
											throws Exception {
		
		
		MarketInfo market = new MarketInfo();

		
		HttpSession session	= request.getSession();
		MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		String	userId = memberDTO.getUserId();
		
		int ibuycount = Integer.parseInt(buycount);
		int isalecount = Integer.parseInt(salecount);
		
		market.setUserId(userId);
		market.setBuycount(ibuycount);
		market.setSalecount(isalecount);
		
		System.out.println("================================================================" + market + "==========================================");

		ModelAndView	mav			= new ModelAndView();

		for(int i = 1; i <= 2; i++) {
			System.out.println("-------------반복문 테스트-----------------");

			System.out.println("==================================================================" + infoService.infoListTotalCount(i, market));
			
			// 화면에 출력할 데이터를 가져온다.
			//List<BuyArticleDTO> list = infoService.infoListPaging(i);
			
			List<BuyArticleDTO> list = infoService.infoList(i, market);			
			System.out.println("리스트:" + i + list);
			

			mav.addObject("articlesList" + i, 	list);   // >> list를 담아서 넘김

			
			
		}
		mav.addObject("market", market);
		System.out.println("================================================================" + mav + "==========================================");

		return mav;
		
	} // End - 게시글 목록 (페이징) 화면 보여주기 
	
	

	
	
}
