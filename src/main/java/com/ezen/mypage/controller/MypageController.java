package com.ezen.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	//경은
	@RequestMapping(value="/auctionDealList", method=RequestMethod.GET)
	public String auctionDealList(Model model) {
		return "/myPage/auctionDealList";
	}
	
	
	
	
	
	
}//class
