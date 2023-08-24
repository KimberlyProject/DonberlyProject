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
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public String qnaView(Model model) {

		return "/ccenter/qna";
	}
	
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public String reportView(Model model) {
	
		return "/ccenter/report";
	}
	

	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String noticeView(Model model) {
	
		return "/ccenter/notice";
	}

}
