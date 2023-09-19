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
import com.ezen.auction.dto.Criteria;
import com.ezen.auction.dto.PageMaker;
import com.ezen.auction.dto.PageMaker2;
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
		@RequestMapping(value="auction_maintosearch", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView auctionPaging(HttpServletRequest req, HttpServletResponse res, SearchCriteria cri)
		        throws Exception {
		    
		    System.out.println("메인페이지 페이징/검색조건 Controller");
		    String viewName = "/auction/auction_search"; //사진 배열로 다른jsp파일을 열어줌, 페이징버튼 정상
		    ModelAndView mav = new ModelAndView(viewName);
		    
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(auctionService.auctionTotalCount(cri));
		    
		    List<AuctionDTO> articles = auctionService.auctionPaging(cri);
		    List<List<AucImgDTO>> imgLists = new ArrayList<List<AucImgDTO>>();		    
		    for(AuctionDTO auctionDTO : articles) {
		        int aucCode = auctionDTO.getAucCode();
		        List<AucImgDTO> imgs = auctionService.auctionPagingImg(aucCode);
		        imgLists.add(imgs);
		        mav.addObject("imgs", imgs);
		    }
		    
		    mav.addObject("imgs", imgLists); //이중리스트, jsp에서 ${imgs[articleNum.index]}로 출력
		    mav.addObject("articles", articles);
		    mav.addObject("pageMaker", pageMaker);
		    mav.addObject("cri", cri);
		    return mav;
		}
		
		//-------------------------------------------------------------------------------------------------------------//

		//마이페이지 내가 올린 경매글
		@RequestMapping(value="/myAuction", method=RequestMethod.GET)
		public ModelAndView myAuction(@RequestParam("aucId") String aucId, HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
			System.out.println("마이페이지 경매내역 게시글 불러오기 Controller");
			String viewName = "/mypage/myAuction";
			ModelAndView mav = new ModelAndView(viewName);
			
			List<AuctionDTO> articles	= auctionService.myauctionArticles(aucId);
			List<List<AucImgDTO>> imgLists = new ArrayList<List<AucImgDTO>>();
			for(AuctionDTO auctionDTO : articles) {
				int aucCode = auctionDTO.getAucCode();
				List<AucImgDTO> imgs = auctionService.mypageImg(aucCode);
				imgLists.add(imgs);
				mav.addObject("imgs", imgs);
			}
			
			mav.addObject("imgs", imgLists);
			mav.addObject("articles", articles);	
			return mav;
		}	
		
		//-------------------------------------------------------------------------------------------------------------//

		//마이페이지 내가 입찰한 경매글
		@RequestMapping(value="/myBid", method=RequestMethod.GET)
		public ModelAndView myBid(@RequestParam("cstmId") String cstmId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String viewName = "/mypage/myBid";
			ModelAndView mav = new ModelAndView(viewName);
			
			List<AuctionDTO> articles	= auctionService.mybidArticles(cstmId);
			List<List<AucImgDTO>> imgLists = new ArrayList<List<AucImgDTO>>();
			for(AuctionDTO auctionDTO : articles) {
				int aucCode = auctionDTO.getAucCode();
				List<AucImgDTO> imgs = auctionService.mypageImg(aucCode);
				imgLists.add(imgs);
				mav.addObject("imgs", imgs);
			}
			
			mav.addObject("imgs", imgLists);
			mav.addObject("articles", articles);				
			return mav;
		}	

}
