package com.ezen.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/myPage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="/salesHistory", method=RequestMethod.GET)
	public String salesHistory(Model model) {
		System.out.println("마이페이지 판매내역 조회!!!!!!!!!!!!!!!!");
		return "/mypage/salesHistory";
	}
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String Calendar(Model model) {
		System.out.println("마이페이지 캘린더!!!!!!!!!!!!!!!!");
		return "/mypage/calendar";
	}
	
	@RequestMapping(value="/myInfo.do", method=RequestMethod.GET)
	public ModelAndView getMyInfo() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/myInfo");

		return mav;
	}

  	@RequestMapping(value="/myProfileUpdate", method=RequestMethod.GET)
  	public String getUserProfileEditor(Model model){
  		System.out.println("프로필 수정 화면 접속");
  		return "mypage/myProfileUpdate";
  	}
  	


}
