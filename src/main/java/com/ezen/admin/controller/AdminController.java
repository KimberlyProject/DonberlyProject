package com.ezen.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ezen.admin.service.AdminService;
import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.PageMaker;
import com.ezen.admin.dto.ReportCriteria;
import com.ezen.admin.dto.ReportPageMaker;
import com.ezen.admin.dto.SearchCriteria;
import com.ezen.member.dto.MemberDTO;

import java.util.Collections;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@Inject
	private AdminService adminService;
	
	//-----------------------------------------------------------------------------------------------------------
	// 관리자 탭: 1:1 문의하기 전체 조회 + 검색
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/oneOnOneInquiry", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listOneOnOne(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri) throws Exception {
		
		System.out.println("시작");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView   mav   = new ModelAndView(viewName);
		
		SearchCriteria	scri	= new SearchCriteria();
		scri = (cri);
		
		// 화면에 출력한 데이터를 가져온다.
		List<CcenterDTO> listOneOnOne = adminService.listOneOnOne(cri);
		
		System.out.println(listOneOnOne);
		System.out.println("Controller ==================================> cri " + cri);
		
		// mav에 object를 추가
		mav.addObject("ask", 	listOneOnOne);
		mav.addObject("scri",	scri);
		mav.addObject("cri",	cri);
		System.out.println("Controller2 ==================================> cri " + cri);
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/delArticle", method=RequestMethod.POST)
	public ModelAndView delArticle(HttpServletRequest request) throws Exception {
		String articleNo[] = request.getParameterValues("num");
		
		for (int i = 0; i < articleNo.length; i++) {
			logger.info(" " + articleNo[i]);
		}
		
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/admin/oneOnOneInquiry";
		
		for(int i = 0; i < articleNo.length; i++) {
			//Map map = new HashMap("articleNo", articleNo[i]);
			
			if(!articleNo[i].isEmpty()) {
				logger.info("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + articleNo[i].getClass().getName());
				logger.info("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" + articleNo[i]);
				adminService.deleteArticle(Integer.parseInt(articleNo[i]));
			}
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 관리자 탭: 신고하기 전체 조회 + 페이징
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/reportAnswer", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listReportAnswer(HttpServletRequest request, HttpServletResponse response, ReportCriteria rcri) throws Exception {
		
		System.out.println("시작");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView   mav   = new ModelAndView(viewName);
		
		ReportPageMaker reportPageMaker = new ReportPageMaker();
		reportPageMaker.setRcri(rcri);
		System.out.println("################################# Controller rcri => " + rcri);
		
		// rcri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		reportPageMaker.setTotalCount(adminService.reportAnswerTotalCount(rcri));
		
		// 화면에 출력한 데이터를 가져온다.
		List<ReportDTO> listReportAnswer = adminService.listReportAnswer(rcri);
		
		System.out.println(listReportAnswer);
		
		// mav에 object를 추가
		mav.addObject("report",				listReportAnswer);
		mav.addObject("reportPageMaker",	reportPageMaker);
		mav.addObject("rcri",				rcri);
		
		return mav;
	}
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원 전체 조회 + 페이징 + 검색
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
		List<MemberDTO> list = adminService.memberList(cri);

		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("################################ pageMaker ==> " + pageMaker);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ list ==> " + list);
		mav.addObject("memberList",		list);
		mav.addObject("pageMaker",		pageMaker);
		mav.addObject("cri",			cri);
		
		return mav;
	}
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원아이디에 대한 상세 정보 조회
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberDetail", method=RequestMethod.GET)
	public void memberDetail(@RequestParam("userId") String userId, Model model) throws Exception {
		
		MemberDTO memberDTO = adminService.memberDetail(userId);
		model.addAttribute("detail", memberDTO);
		
		System.out.println("상세정보 : " + memberDTO);

	}
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원 정보 수정
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO) throws Exception {
		logger.info("회원정보수정 Controller ==> " + memberDTO);
		// Client에서 보내오는 데이터들의 name이 맞으면 memberDTO에 알아서 값이 들어간다.
		adminService.memberUpdate(memberDTO);
		
		return "redirect:/admin/memberDetail?userId=" + memberDTO.getUserId();
	}
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원 정보 삭제
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(MemberDTO memberDTO, Model model) throws Exception {
		logger.info("회원 정보 삭제 Controller ==> " + memberDTO);
		
		adminService.memberDelete(memberDTO.getUserId());
		
		return "redirect:/admin/memberList";
	}
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원 7일 정지
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/Asuspension", method=RequestMethod.POST)
	public void Asuspension(String userId) throws Exception {
		logger.info("회원 3일정지 POST " + userId);
		adminService.Asuspension(userId);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 관리자 탭: 회원 영구 정지
	//--------------------------------------------------------------------------------------------------
	@RequestMapping(value="/Psuspension", method=RequestMethod.POST)
	public void Psuspension(String userId) throws Exception {
		logger.info("회원 3일정지 POST " + userId);
		adminService.Psuspension(userId);
	}
	

}
