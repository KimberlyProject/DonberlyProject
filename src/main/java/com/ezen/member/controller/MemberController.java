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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
	//찬호
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin(Model model){
		System.out.println("로그인 화면 접속");
		return "member/login";
	}
	

	//-----------------------------------------------------------------------------------------------------------
	// 회원 가입 GET (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String getRegisterAjax() throws Exception {
		
		logger.info("MemberController 회원 가입 GET AJAX");
		return "/member/membership";
		
	} // End - public String getRegisterAjax()
	
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
	

	//-----------------------------------------------------------------------------------------------------------
	// 회원 가입 POST (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/membership", method=RequestMethod.POST) 
	public String postRegisterAjax(MemberDTO memberDTO) throws Exception {
		
		logger.info("MemberController 회원 가입 화면 POST AJAX : " + memberDTO);
		
		// 회원 아이디가 존재하는지 먼저 검사한다.
		int result = memberService.idCheck(memberDTO);
		
		try {
			if(result == 1) {	// 아이디에 해당하는 회원이 이미 존재한다면
				return "/member/registerAjax";
			} else if(result == 0) { // 입력한 아이디로 회원가입이 가능하다면
				memberService.membership(memberDTO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/member/login";
		
	} // End - public String postRegisterAjax()
	
	//-----------------------------------------------------------------------------------------------------------
	// 로그아웃
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		// 로그아웃 버튼을 눌렀을 경우에는 세션을 없앤다.
		session.invalidate();
		return "redirect:/member/login";
	} // End - 로그아웃
	
	
	
	@RequestMapping(value="/findPasswd", method=RequestMethod.GET)
	public String getFindPasswd(Model model) {
		System.out.println("비밀번호찾기 화면 접속!!!!!!!!!!!!!!!");
		return "member/findPasswd";
	}

	//경은
    @RequestMapping(value="/logOn", method=RequestMethod.POST)
    public ModelAndView logOn(@ModelAttribute("member") MemberDTO member,
                        RedirectAttributes rAttr,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {
                         
       ModelAndView mav = new ModelAndView();  
       MemberDTO memberDTO = memberService.logOn(member);
       HttpSession session = request.getSession();
       
       if(memberDTO != null) {   
          session.setAttribute("member",    memberDTO);
          session.setAttribute("isLogOn", true);
          String action = (String)session.getAttribute("action");
          System.out.println("Login action : " + action);
          
          session.removeAttribute("action");
          
          if(action != null) {
             mav.setViewName("redirect:" + action);
          } else {
             mav.setViewName("redirect:/");
          }
       } else { // 아이디와 비밀번호에 해당하는 정보가 없으면
          session.setAttribute("member", null);
          rAttr.addFlashAttribute("msg",  false);
          mav.setViewName("redirect:/member/login");
       }

       return mav;                   
    }//경은
	
  	@RequestMapping(value="/profile", method=RequestMethod.GET)
  	public String getProfile(Model model){
  		System.out.println("프로필 화면 접속");
  		return "member/profile";
  	}

  	@RequestMapping(value="/userProfileEditor", method=RequestMethod.GET)
  	public String getUserProfileEditor(Model model){
  		System.out.println("프로필 수정 화면 접속");
  		return "member/userProfileEditor";
  	}
}




