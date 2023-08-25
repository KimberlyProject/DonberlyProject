package com.ezen.ccenter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/ccenter")
public class CcenterController {
	
	private static final Logger logger = LoggerFactory.getLogger(CcenterController.class);
	
	//보여주기만 하는 컨트롤러
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 공지사항 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String getNotice(Model model) {
		System.out.println("공지사항 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/notice";
	}

	//---------------------------------------------------------------------------------------------------------------------------------------
	// qna 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public String getQna(Model model) {
		System.out.println("qna 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/qna";
	}
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 신고하기 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public String getReport(Model model) {
		System.out.println("신고하기 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/report";
	}
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 1:1문의 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/askOnetoOne", method=RequestMethod.GET)
	public String getAskOneToOne(Model model) {
		System.out.println("1:1문의 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/askOnetoOne";
	}
}
