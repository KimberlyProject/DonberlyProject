package com.ezen.ccenter.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ccenter.service.CcenterService;
import com.ezen.member.dto.MemberDTO;
import com.ezen.member.service.MemberService;



@Controller
@RequestMapping("/ccenter")
public class CcenterController {
	
	private static final Logger logger = LoggerFactory.getLogger(CcenterController.class);
	
	@Inject
	@Autowired
	private CcenterService ccenterService;
	
	@Autowired
	private MemberService memberService;
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 공지사항 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String getNotice(Model model) {
		System.out.println("공지사항 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/notice";
	}

	//---------------------------------------------------------------------------------------------------------------------------------------
	// QNA 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public String getQna(Model model) {
		System.out.println("QNA 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/qna";
	}
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 신고하기 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public ModelAndView getReport(String report) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ccenter/report");

		System.out.println(report);
		
		mav.addObject("report", report);
		
		
		return mav;
	}
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 1:1문의 화면 접속
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/askOnetoOne", method=RequestMethod.GET)
	public String getAskOneToOne(Model model) {
		System.out.println("1:1문의 화면 접속!!!!!!!!!!!!!!!!!");
		return "/ccenter/askOnetoOne";
	}
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 1:1문의 문의 글 작성
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/addNewAsk.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewAsk(HttpServletRequest Request, HttpServletResponse response)
			throws Exception {
			
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		// pom.xml에 업로드관련 라이브러리를 추가한다.
		// 먼저 servlet-xml에 파일 업로드 관련 설정을 해야 한다.
		// 파일업로드에 대한 규칙(multipartResolver)을 적용한다. 

		System.out.println("1대1문의 Controller 시작");
		
		HttpSession session	= Request.getSession();
		MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		String	userId = memberDTO.getUserId();
		
		logger.info("2222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
		logger.info("userId : " + userId);
		
		articleMap.put("userId", 	userId);
		System.out.println("id 보여줘" + userId);
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		//
		Enumeration enu = Request.getParameterNames();
	    System.out.println("enu : " + enu);
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = Request.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			articleMap.put(name, value);
		}
	
		//
		
		try {
			int articleNo = ccenterService.addNewAsk(articleMap);
			
			System.out.println(articleNo);
			
			message	 = "<script>";
			message	+= "alert('새로운 글을 추가하였습니다.');";
			message	+= "location.href='" + Request.getContextPath() + "/';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + Request.getContextPath() + "/';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		System.out.println("1대1문의 Controller 끝");
		return resEnt;
		
	}
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	// 신고하기 문의 글 -> 관리자 페이지로 작성
	//---------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/addNewReport.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReport(HttpServletRequest Request, HttpServletResponse response)
			throws Exception {
			
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		// pom.xml에 업로드관련 라이브러리를 추가한다.
		// 먼저 servlet-xml에 파일 업로드 관련 설정을 해야 한다.
		// 파일업로드에 대한 규칙(multipartResolver)을 적용한다. 

		System.out.println("신고하기 Controller 시작");
		
		HttpSession session	= Request.getSession();
		MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		String	userId = memberDTO.getUserId();
		
		logger.info("3333333333333333333333333333333333333333333333333333333333333333333333");
		logger.info("userId : " + userId);
		
		articleMap.put("userId", 	userId);
		System.out.println("id 보여줘" + userId);
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		//
		Enumeration enu = Request.getParameterNames();
	    System.out.println("enu : " + enu);
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = Request.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			articleMap.put(name, value);
		}
	
		//
		
		try {
			int articleNo = ccenterService.addNewReport(articleMap);
			
			System.out.println(articleNo);
			
			message	 = "<script>";
			message	+= "alert('새로운 글을 추가하였습니다.');";
			message	+= "location.href='" + Request.getContextPath() + "/';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + Request.getContextPath() + "/';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		System.out.println("신고하기 Controller 끝");
		return resEnt;
		
	}
	
	//-----------------------------------------------------------------------------------------------------------
		// 아이디 중복 검사
		//-----------------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value="/idCheck", method=RequestMethod.POST)
		public int idCheck(MemberDTO memberDTO) throws Exception {
			
			logger.info("아이디 중복 검사 : " + memberDTO);
			
			int result = memberService.idCheck(memberDTO);
			logger.info("아이디 중복 검사 결과 : " + result);
			
			// result 값 : 1이면 아이디에 해당하는 정보가 이미 존재
			//			   0이면 아이디에 해당하는 정보가 존재하지 않는다.
			return result;
				
		} // End - public int idCheck(MemberDTO memberDTO)
		
	
	
}
