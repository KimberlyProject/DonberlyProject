package com.ezen.admin.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ezen.admin.service.AdminService;
import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.PageMaker;
import com.ezen.admin.dto.SearchCriteria;
import com.ezen.member.dto.MemberDTO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@Inject
	private AdminService adminService;
	

	
	//-----------------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 생성
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/oneOnOneInquiry", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listOneOnOne(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("시작");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView   mav   = new ModelAndView(viewName);
		
		// 화면에 출력한 데이터를 가져온다.
		List<CcenterDTO> listOneOnOne = adminService.listOneOnOne();
		
		System.out.println(listOneOnOne);
		
		// mav에 object를 추가
		mav.addObject("ask", listOneOnOne);
		
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/delArticle", method=RequestMethod.POST)
	public ModelAndView delArticle(HttpServletRequest request) throws Exception {
		int articleNo[] = Integer.parseInt(request.getParameterValues("num"));
		
		logger.info("articleNo : " + articleNo);
		
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/admin/oneOnOneInquiry";
		
		for(int i = 0; i < articleNo.length; i++) {
			adminService.deleteArticle(Integer.parseInt(articleNo[i]));
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 신고하기 리스트 생성
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/reportAnswer", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listReportAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("시작");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView   mav   = new ModelAndView(viewName);
		
		// 화면에 출력한 데이터를 가져온다.
		List<ReportDTO> listReportAnswer = adminService.listReportAnswer();
		
		System.out.println(listReportAnswer);
		
		// mav에 object를 추가
		mav.addObject("report", listReportAnswer);
		
		return mav;
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 조회 + 페이징 + 검색
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberList", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberListPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri) throws Exception {
			
		String viewName = (String)request.getAttribute("viewName");
		
		ModelAndView	mav			= new ModelAndView(viewName);
		
		PageMaker		pageMaker	= new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ cri ==> " + cri);
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		pageMaker.setTotalCount(adminService.memberListTotalCount(cri));	
		logger.info("게시물의 총 건수 : " + pageMaker.getTotalCount());
		
		// 화면에 출력할 데이터를 가져온다.
		List<MemberDTO> list = adminService.memberListPaging(cri);

		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("################################ pageMaker ==> " + pageMaker);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ list ==> " + list);
		mav.addObject("memberList",		list);
		mav.addObject("pageMaker",		pageMaker);
		mav.addObject("cri",			cri);
		
		return mav;
	}
	
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
