package com.ezen.auction.controller;

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
import com.ezen.auction.service.AuctionService;

@Controller
@RequestMapping("auction")
public class AuctionSubController {

		@Inject
		AuctionService auctionService;
		AuctionDTO auctionDTO;
	
		//마이페이지 경매내역 불러오기
		@RequestMapping(value="/auctionDealList", method=RequestMethod.GET)
		public ModelAndView myPageArticlesImgs(@RequestParam("aucId") String aucId, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			System.out.println("경매장 메인 리스트불러오기 컨트롤러");			
			
			String viewName = (String)request.getAttribute("/myPage/auctionDealList");
			ModelAndView mav = new ModelAndView(viewName);
			
			List<AuctionDTO> articles	= auctionService.myPageArticles(aucId);
			
			for (AuctionDTO auctionDTO : articles) {
			    int aucCode = auctionDTO.getAucCode();
			    List<AucImgDTO> imgs = auctionService.myPageImgs(aucCode);
			    mav.addObject("imgs", imgs);
			}
						
			mav.addObject("articles", articles);	
			return mav;
		}	
	
}
