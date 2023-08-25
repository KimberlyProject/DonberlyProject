package com.ezen.member.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 로그인 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin(Model model){
		System.out.println("로그인 화면 접속");
		return "member/login";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 로그인 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String getMembership(Model model){
		System.out.println("회원가입 접속");
		return "member/membership";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 아이디찾기 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String getFindId(Model model) {
		System.out.println("아이디찾기 화면 접속!!!!!!!!!!!!!!!!!!");
		return "member/findId";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 비밀번호찾기 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findPasswd", method=RequestMethod.GET)
	public String getFindPasswd(Model model) {
		System.out.println("비밀번호찾기 화면 접속!!!!!!!!!!!!!!!");
		return "member/findPasswd";
	}

}