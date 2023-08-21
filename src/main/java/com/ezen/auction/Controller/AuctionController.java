package com.ezen.auction.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.member.Controller.MemberController;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value="/auction_form", method=RequestMethod.GET)
	public String getLogin(Model model){
		System.out.println("경매장 입장");
		return "auction/auction_form";
	}
}
