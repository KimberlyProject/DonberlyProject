package com.ezen.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.member.dto.MemberDTO;
import com.ezen.mypage.dto.CalendarDTO;
import com.ezen.mypage.service.MypageService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	// @Autowired(required=true)
	// private CalendarDTO calendarDTO;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="/salesHistory", method=RequestMethod.GET)
	public String salesHistory(Model model) {
		System.out.println("마이페이지 판매내역 조회!!!!!!!!!!!!!!!!");
		return "/mypage/salesHistory";
	}
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public ModelAndView getCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("마이페이지 캘린더");
		String	viewName	= (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if(member == null) {
			return mav;
		}
		String userId = member.getUserId();
		logger.info("회원의 아이디 : " + userId);
		List<CalendarDTO> list = mypageService.calendarList(userId);
		logger.info("리스트 목록 : " + list);
		
		ObjectMapper mapper = new ObjectMapper();
		String schedulelist = mapper.writeValueAsString( list );
		
		mav.addObject("calendar", schedulelist);
		
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/calendar", method=RequestMethod.POST)
	public int postCalendar(HttpServletRequest request, HttpServletResponse response, CalendarDTO calendarDTO) throws Exception {
		logger.info("마이페이지 캘린더 일정추가" + calendarDTO);
		
		int insertCalendar = mypageService.inserCalendar(calendarDTO);
		logger.info("추가된 일정 : " + insertCalendar);
		
		return insertCalendar;		
	}
	
	@RequestMapping(value="/calendarDelete", method=RequestMethod.POST)
	public String calendarDelete(HttpServletRequest request, HttpServletResponse response, int calId) throws Exception {
		logger.info("마이페이지 캘린더 일정삭제" + calId);
		//int id = Integer.parseInt(calId); 
		int DeleteCalendar = mypageService.DeleteCalendar(calId);
		logger.info("삭제된 일정 : " + DeleteCalendar);
		
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
