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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.member.dto.MemberDTO;
import com.ezen.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
<<<<<<< HEAD
	@Inject
	private MemberService memberService;
		
	//찬호
=======
	//----------------------------------------------------------------------------------------------------------------------------
	// 로그인 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
>>>>>>> f17d43e41db8b3ebd6b310731054f5b0ba105b93
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin(Model model){
		System.out.println("로그인 화면 접속");
		return "member/login";
	}
	
<<<<<<< HEAD
	//찬호
=======
	//----------------------------------------------------------------------------------------------------------------------------
	// 로그인 화면 접속
	//----------------------------------------------------------------------------------------------------------------------------
>>>>>>> f17d43e41db8b3ebd6b310731054f5b0ba105b93
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String getMembership(Model model){
		System.out.println("로그인 화면 접속");
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
	
	
}




