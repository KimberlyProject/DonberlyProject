package com.ezen.auction.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.auction.dto.AucImgDTO;
import com.ezen.auction.dto.AuctionDTO;
import com.ezen.auction.dto.PageMaker;
import com.ezen.auction.dto.SearchCriteria;
import com.ezen.auction.service.AuctionService;

@Controller
@RequestMapping("auction")
public class AuctionSubController {

		@Inject
		AuctionService auctionService;
		AuctionDTO auctionDTO;
	
		//-------------------------------------------------------------------------------------------------------------//

		//게시글 페이징, 검색조건
		@RequestMapping(value="auction_main.do", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView auctionPaing(HttpServletRequest req, HttpServletResponse res, SearchCriteria cri)
				throws Exception {
			
			System.out.println("페이징 검색조건 Controller");
			
			String viewName = (String)req.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(auctionService.auctionTotalCount(cri));
			
			List<AuctionDTO> articles = auctionService.auctionPaging(cri);
			List<AucImgDTO> img = new ArrayList<AucImgDTO>();
			
			for(int i=0; i<articles.size();i++) {
				
			}
			/*
			for (AuctionDTO auctionDTO : articles) {
				int aucCode = auctionDTO.getAucCode();
				List<AucImgDTO> imgs = auctionService.auctionPagingImg(aucCode);
				mav.addObject("imgs", imgs);
			}*/
			System.out.println("*******************"+img);
			mav.addObject("articles", articles);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("cri", cri);
			return mav;
		}
		
		//-------------------------------------------------------------------------------------------------------------//

		//마이페이지 내가 올린 경매글
		@RequestMapping(value="/myAuction", method=RequestMethod.GET)
		public ModelAndView myAuction(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("마이페이지 경매내역 게시글 불러오기 Controller");
			String viewName = "/mypage/myAuction";
			List<AuctionDTO> articles	= auctionService.listArticles(); //게시글 여러개 forEach문으로 출력
			List<AucImgDTO> imgs = auctionService.listArticlesImg(); //이미지 여러개 forEach문으로 출력
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("articles", articles);	
			mav.addObject("imgs", imgs);
			return mav;
		}	
		
		//-------------------------------------------------------------------------------------------------------------//

		//마이페이지 내가 입찰한 경매글
		@RequestMapping(value="/myBid", method=RequestMethod.GET)
		public ModelAndView myBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("마이페이지 경매내역 게시글 불러오기 Controller");
			String viewName = "/mypage/myBid";
			List<AuctionDTO> articles	= auctionService.listArticles(); //게시글 여러개 forEach문으로 출력
			List<AucImgDTO> imgs = auctionService.listArticlesImg(); //이미지 여러개 forEach문으로 출력
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("articles", articles);	
			mav.addObject("imgs", imgs);
			return mav;
		}	

}
