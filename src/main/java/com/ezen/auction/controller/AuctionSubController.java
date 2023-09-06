package com.ezen.auction.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.auction.dto.AuctionDTO;
import com.ezen.auction.dto.PageMaker;
import com.ezen.auction.dto.SearchCriteria;
import com.ezen.auction.service.AuctionService;
import com.ezen.board.dto.SaleArticleVO;

@Controller
@RequestMapping("/auctionSub")
public class AuctionSubController {

	@Inject
	private AuctionService auctionService;
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionSubController.class);
	
	//게시글 페이징, 검색조건
	@RequestMapping(value="auctionPaging", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView auctionPaing(HttpServletRequest req, HttpServletResponse res, SearchCriteria cri)
			throws Exception {
		
		System.out.println("paging Controller");
		
		String viewName = "/auction/auction_main"; //찾아지는데, 이미지가 안옴
		ModelAndView mav = new ModelAndView(viewName);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(auctionService.auctionTotalCount(cri));
		List<AuctionDTO> list = auctionService.auctionPaging(cri);
	
		mav.addObject("articles", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("cri", cri);

		return mav;
	}

}
