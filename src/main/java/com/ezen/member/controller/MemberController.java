package com.ezen.member.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.member.dto.MemberDTO;
import com.ezen.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	

	@Inject
	private MemberService memberService;
		
	

	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String getMembership(Model model){
		System.out.println("로그인 화면 접속");
		return "member/membership";
	}
	

	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String getFindId(Model model) {
		System.out.println("아이디찾기 화면 접속!!!!!!!!!!!!!!!!!!");
		return "member/findId";
	}
	
	
	@RequestMapping(value="/findPasswd", method=RequestMethod.GET)
	public String getFindPasswd(Model model) {
		System.out.println("비밀번호찾기 화면 접속!!!!!!!!!!!!!!!");
		return "member/findPasswd";
	}

	//찬호
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin(@RequestParam(value= "action", required=false) String action,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// action 값을 가지고 Session을 설정한다.
		System.out.println("Login GET action : " + action);
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		return "/member/login";
	} // End - public String getLogin()
	
	//경은
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberDTO member,
							  RedirectAttributes rAttr,
							  HttpServletRequest request, HttpServletResponse response) throws Exception {
								
		ModelAndView mav = new ModelAndView();  
		
		// 로그인한 회원정보가 있는지 검사한다.
		MemberDTO memberDTO = memberService.login(member);
		
		// 세션을 사용할 준비를 한다.
		HttpSession session = request.getSession();
		
		//-----------------------------------------------------------------------------------------------------------
		if(memberDTO != null) {	// 아이디와 비밀번호에 맞는 회원정보를 찾아왔으면
			// 세션을 발급한다.
			session.setAttribute("member", 	memberDTO);
			session.setAttribute("isLogOn", true);
			session.setMaxInactiveInterval(60 * 180);
			String action = (String)session.getAttribute("action");
			System.out.println("Login action : " + action);
			System.out.println("Login session : " + member);
			System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			
			session.removeAttribute("action");
			
			if(action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/board/listArticles.do");
			}
			
			
		} else { // 아이디와 비밀번호에 해당하는 정보가 없으면
			session.setAttribute("member", null);
			rAttr.addFlashAttribute("msg",  false);
			mav.setViewName("redirect:/member/login");
		}
		
		return mav;							  
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String getLogout (@RequestParam(value="action", required=false) String action,
							HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		 
		return "/member/login";
	}
    

}




