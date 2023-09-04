package com.ezen.admin.controller;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//--------------------------------------------------------------------------------------------------
	// 회원아이디에 대한 상세 정보 조회
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberDetail", method=RequestMethod.GET)
	public void memberDetail(@RequestParam("userId") String userId, Model model) throws Exception {
		
		MemberDTO memberDTO = adminService.memberDetail(userId);
		model.addAttribute("detail", memberDTO);
		
		System.out.println("상세정보 : " + memberDTO);

	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO) throws Exception {
		logger.info("회원정보수정 Controller ==> " + memberDTO);
		// Client에서 보내오는 데이터들의 name이 맞으면 memberDTO에 알아서 값이 들어간다.
		adminService.memberUpdate(memberDTO);
		
		return "redirect:/admin/memberDetail?userId=" + memberDTO.getUserId();
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 정보 삭제
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(MemberDTO memberDTO, Model model) throws Exception {
		logger.info("회원 정보 삭제 Controller ==> " + memberDTO);
		
		adminService.memberDelete(memberDTO.getUserId());
		
		return "redirect:/admin/memberList";
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 7일 정지
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/Asuspension", method=RequestMethod.POST)
	public String Asuspension(String userId) throws Exception {
		logger.info("회원 3일정지 POST " + userId);
		adminService.Asuspension(userId);
		return "redirect:/admin/memberList";
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 영구 정지
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/Psuspension", method=RequestMethod.POST)
	public String Psuspension(String userId) throws Exception {
		logger.info("회원 3일정지 POST " + userId);
		adminService.Psuspension(userId);
		return "redirect:/admin/memberList";
	}
}
