package com.ezen.admin.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/oneOnOneInquiry", method=RequestMethod.GET)
	public String oneOnOneInquiry(Model model) {
		System.out.println("관리자 1:1문의화면 접속!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "/admin/oneOnOneInquiry";
	}
	
	@RequestMapping(value="/memberList", method=RequestMethod.GET)
	public String memberList(Model model) {
		System.out.println("회원목록 화면 접속!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "/admin/memberList";
	}
}
