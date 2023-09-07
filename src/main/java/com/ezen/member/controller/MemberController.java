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
	// 닉네임 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="/nickCheck", method=RequestMethod.POST)
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		
		logger.info("닉네임 중복 검사 : " + memberDTO);
		
		int result = memberService.nickCheck(memberDTO);
		logger.info("닉네임 중복 검사 결과 : " + result);
		
		// result 값 : 1이면 닉네임에 해당하는 정보가 이미 존재
		//			   0이면 닉네임에 해당하는 정보가 존재하지 않는다.
		return result;
		
	} // End - public int nickCheck(MemberDTO memberDTO)

	
	
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
	
	
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String getFindId(Model model) {
		System.out.println("아이디찾기 화면 접속!!!!!!!!!!!!!!!");
		return "member/findId";
	}
	@ResponseBody
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(Model model, MemberDTO memberDTO) throws Exception {
		System.out.println("아이디찾기");
		String result = memberService.findId(memberDTO);
		System.out.println("---------------------------------------------------------------------------------" + result);
		return result;
	}
	@RequestMapping(value="/findPasswd", method=RequestMethod.GET)
	public String getFindPasswd(Model model) {
		System.out.println("비밀번호찾기 화면 접속!!!!!!!!!!!!!!!");
		return "member/findPasswd";
	}
	@ResponseBody
	@RequestMapping(value="/findPasswd", method=RequestMethod.POST)
	public String findPasswd(Model model, MemberDTO memberDTO) throws Exception {
		System.out.println("비밀번호찾기");
		String result = memberService.findPasswd(memberDTO);
		System.out.println("---------------------------------------------------------------------------------" + result);
		return result;
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
	   @RequestMapping(value="/login.do", method=RequestMethod.POST)
	   public ModelAndView login(@ModelAttribute("member") MemberDTO member,
	                       RedirectAttributes rAttr,
	                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	                        
	      ModelAndView mav = new ModelAndView();  
	      
	      // 로그인한 회원정보가 있는지 검사한다.
	      MemberDTO memberDTO = memberService.login(member); 
	      
	      // 세션을 사용할 준비를 한다.
	      HttpSession session = request.getSession();
	      
	      //-----------------------------------------------------------------------------------------------------------
	      if(memberDTO != null) {   // 아이디와 비밀번호에 맞는 회원정보를 찾아왔으면
	         // 세션을 발급한다.
	         String userId = memberDTO.getUserId();
	         MemberDTO memberLevel = memberService.memberLevel(userId);
	         
	    	 session.setAttribute("memberlevel", memberLevel);
	         session.setAttribute("member",    memberDTO);
	         session.setAttribute("isLogOn", true);
	         String action = (String)session.getAttribute("action");
	         System.out.println("Login action : " + action);
	         System.out.println("Login session : " + member);
	         System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

	         session.removeAttribute("action");
	         
	         
	         if(action != null) {
	            mav.setViewName("redirect:" + action);
	         } else {
	            mav.setViewName("redirect:/member/login");
	         }
	         
	         
	      } else { // 아이디와 비밀번호에 해당하는 정보가 없으면
	    	 session.setAttribute("memberlevel", null);
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
		 
		return "redirect:/member/login";
	}
	
	/*
	 * @RequestMapping(value="/profile", method=RequestMethod.GET) public String
	 * getProfile(Model model){ System.out.println("프로필 화면 접속"); return
	 * "member/profile"; }
	 */
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public void memberProfile(@RequestParam("userId") String userId, Model model) throws Exception {
		
		MemberDTO memberDTO = memberService.memberProfile(userId);
		model.addAttribute("profile", memberDTO);
		
		System.out.println("상세정보 : " + memberDTO);

	}

  	// 11:52
  	// 회원 정보 수정 GET
    @RequestMapping(value = "/userProfileEditor", method = RequestMethod.GET)
    public String getUserProfileEditor(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        MemberDTO loggedInMember = (MemberDTO) session.getAttribute("member");

        if (loggedInMember != null) {
            MemberDTO memberDTO = memberService.userProfileEditor(loggedInMember.getUserId());
            model.addAttribute("editor", memberDTO);
            return "member/userProfileEditor";
        } else {
            // 로그인이 되어있지 않은 경우 처리 (예: 로그인 페이지로 리다이렉트)
            return "redirect:/member/login";
        }
    }

    // 회원 정보 수정 POST
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
    public String memberUpdate(@ModelAttribute("editor") MemberDTO memberDTO, Model model) throws Exception {
        memberService.memberUpdate(memberDTO);
        return "redirect:/myPage/myInfo"; // 수정이 완료되면 프로필 페이지로 이동하도록 수정
    }
  	
	@RequestMapping(value = "/memberDelete", method=RequestMethod.POST)
	public String MemberDeletePost(MemberDTO memberDTO, Model model) throws Exception {
		
		// 비밀번호와 비밀번호확인이 틀리면 삭제하지 않고 돌아간다.
		if(memberDTO.getPw().equals(memberDTO.getRepw())) {
			memberService.memberDelete(memberDTO);
		} else {
			System.out.println("비밀번호와 비밀번호확인이 틀립니다.\n확인 후 다시 해주세요.");
		}
		
		return "redirect:/member/memberList";
		// return "/member/memberList";
		
	} // End - public String MemberDeletePost(MemberDTO memberDTO, Model model)

}

