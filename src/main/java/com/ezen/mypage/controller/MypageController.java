package com.ezen.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/myPage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="/salesHistory", method=RequestMethod.GET)
	public String salesHistory(Model model) {
		System.out.println("마이페이지 판매내역 조회!!!!!!!!!!!!!!!!");
		return "/myPage/salesHistory";
	}
	
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public String getMyInfo(Model model){
		System.out.println("내정보 화면 접속");
		return "myPage/myInfo";
	}

}
