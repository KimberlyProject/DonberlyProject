package com.ezen.auction.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/auction")
public class AuctionMainController {

	private static final Logger logger = LoggerFactory.getLogger(AuctionMainController.class);

	@RequestMapping(value="/auction_main", method=RequestMethod.GET)
	public String auctionMain(Model model) {
		System.out.println("경매장 입장");
		return "/auction/auction_main";
	}
	
	@RequestMapping(value="/auction_write", method=RequestMethod.GET)
	public String auctionWrite(Model model) {
		System.out.println("경매 글쓰기 화면");
		return "/auction/auction_write";
	}
	

	@RequestMapping(value="/auction_detail", method=RequestMethod.GET)
	public String auctionDetail(Model model) {
		System.out.println("경매 디테일 화면");
		return "/auction/auction_detail";
	}
	
	@RequestMapping(value="/auction_detail_owner", method=RequestMethod.GET)
	public String auctionDetailOwner(Model model) {
		System.out.println("경매 디테일 화면");
		return "/auction/auction_detail_owner";
	}
	
	//--------------------------------------------------------------------------------------------//
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
