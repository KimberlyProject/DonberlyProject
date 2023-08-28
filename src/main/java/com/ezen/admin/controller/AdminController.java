package com.ezen.admin.controller;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.admin.service.AdminService;
//import com.ezen.member.dto.MemberDTO;
import com.ezen.member.dto.MemberDTO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@Inject
	private AdminService adminService;
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 1:1 문의화면 접속
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/oneOnOneInquiry", method=RequestMethod.GET)
	public String getOneOnOneInquiry(Model model) {
		System.out.println("관리자 1:1문의화면 접속!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "/admin/oneOnOneInquiry";
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 조회
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberList", method=RequestMethod.GET)
	public String getMemberList(Model model) throws Exception {
		System.out.println("회원목록 화면 접속!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		List<MemberDTO> memberList = adminService.selectMember();
		System.out.println("회원목록 화면 접속 memberList ==> " + memberList);
		
		// 찾아온 데이터를 Model에 담아 View로 보낸다.
		model.addAttribute("memberList", memberList);

		
		return "/admin/memberList";
	} // End - public String getMemberList(Model model) throws Exception
}
