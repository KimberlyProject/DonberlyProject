package com.ezen.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;
import com.ezen.chat.service.ChatService;
import com.ezen.member.dto.MemberDTO;


@Controller
@RequestMapping("/chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	private int cnt=0;

	@Inject
	private ChatService chatService;
	@Inject
	private ChatDAO chatDAO;
	private ChatListDTO chatListDTO;
	
	
	//채팅창 GET
	@RequestMapping(value="/chattingview", method=RequestMethod.GET)
	public String chattingview(String chatId, HttpServletRequest request) throws Exception{
		
		HttpSession session= request.getSession();
		int ch = Integer.parseInt(chatId);
		List<ChatDTO> chatView = chatService.chatView(ch); //chatList 옮김
		session.setAttribute("session",chatView);
		
		System.out.println("채팅 입장");
		return "/chat/chattingview";
	}
	
	
	//채팅창 POST
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content,
			@RequestParam(value="fromId", required=false) String fromId,
			@RequestParam(value="chatId", required=false) String chatId,
			Model model,HttpServletRequest request, HttpServletResponse response,RedirectAttributes attr) throws Exception{
		
		//값 받기
		//HttpSession session = request.getSession();
		//session.removeAttribute("session");	
		

		System.out.println(content+fromId+chatId);
		
		int ch = Integer.parseInt(chatId);
		//ch로 chatListDTO 찾기 찾아서 스테이터스로 구별해서 to랑 from 넣기
		ChatListDTO chatListDTO = chatService.findArtNo(ch);
		
		//이미 한 채팅 세션으로 보내주기
		List<ChatDTO> chatView = chatService.chatView(ch); //chatList 옮김
		//session.setAttribute("session",chatView);
		//attr.addFlashAttribute("session",chatView );
		//보내주기 끝
		
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setArtNo(chatListDTO.getArtNo());
		chatDTO.setChatId(ch);
		chatDTO.setFromId(fromId);
		chatDTO.setChatContent(content);
		/*
		if(chatListDTO.getStatus().equals("s")) {
			chatDTO.setToId(chatListDTO.getSeller());
		}
		else {
			chatDTO.setToId(chatListDTO.getBuyer());
		}*/
		if(fromId.equals(chatListDTO.getSeller())) {
			chatDTO.setToId(chatListDTO.getBuyer());
		}
		else if(fromId.equals(chatListDTO.getBuyer())) {
			chatDTO.setToId(chatListDTO.getSeller());
		}
		System.out.println("################################chatDTO"+chatDTO);
		chatService.insertContent(chatDTO);  //db에 채팅DTO 넣기
		
	}
	
	//값으로 articleDTO가져오기
	public List<ArticleVO> getArtDTO(int artNo)  throws Exception{
		List<ArticleVO> articleList = chatService.getArtDTO(artNo);
		System.out.println("######################"+articleList);
		return articleList;
	}
	
	//채팅 리스트
	@RequestMapping(value="/chat_list", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ChatList(HttpServletRequest request, HttpServletResponse response,Model model)throws Exception{
		
		HttpSession session	= request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String userId = memberDTO.getUserId();
		System.out.println("###################"+userId);
		
		
		List chatList = chatService.listChat(userId); //chatList 옮김
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("chatList",chatList);//넘겨줄 이름, 데이터
		
		
		//viewName이 없기 때문에 URL로 부터 뷰 이름을 검색한다.
		// /board/listArticlres.do => /vboard/listArticles
		System.out.println("채팅 입장");
		return mav;		//리턴에 경로 없으면 value값에 do빼서 알아서 찾아간다.
		
	}
	
	
	
	//채팅 저장하기
	@RequestMapping(value="/sendChat", method=RequestMethod.POST)
	public String sendChat(@RequestParam(value="content", required=false) String content,@RequestParam(value="fromId", required=false) String fromId,@RequestParam(value="articleNo", required=false) String articleNo, Model model,HttpServletRequest request, HttpServletResponse response  ) throws Exception{
		//채팅방 만들기
				HttpSession session = request.getSession();
				session.removeAttribute("session");	
		
				System.out.println("#################여기로 와");
				ChatListDTO chatListDTO = new ChatListDTO();
				
				String status = articleNo.substring(0,1);
				int artNo;
				artNo = Integer.parseInt(articleNo.substring(1));
				chatListDTO.setArtNo(artNo); //게시글 번호  
				//chatListDTO.setChatId(artNo); //채팅방 번호 (하나씩 늘어야해요)
				List<ArticleVO> a = getArtDTO(artNo);  //articleNo로 articleDTO가져오기 메서드 이름 getArtDTO
				//model.addAttribute("chat", chatListDTO);
				//model.addAttribute("articleD", a);
				
				
				if(status.equals("s")) {
					//판매게시판에서 채팅하는거니까 상대가 판매자 내가 구매자
					logger.info("안녕하세요 여긴 구매자 들어왓어요");
					chatListDTO.setBuyer(fromId); //구매자인 나
					chatListDTO.setSeller(a.get(0).getUserId()); //판매자
					chatListDTO.setStatus("s");
				}
				else if(status.equals("b")) {
					//구매게시판에서 채팅하는거니까 상대가 구매자 내가 판매자
					chatListDTO.setSeller(fromId); //구매자인 나
					chatListDTO.setBuyer(a.get(0).getUserId()); //판매자
					chatListDTO.setStatus("b");
				}
				int chatId = chatService.insertChatList(chatListDTO);//채팅방 번호 내놓기
				//채팅방 만들기 끝
				System.out.println("##########################채팅 아이디"+chatId);

				
				
				ChatDTO chatDTO = new ChatDTO();
				chatDTO.setChatContent(content); //채팅말 넣기
				chatDTO.setFromId(fromId);  //보내는사람 id 넣기
				chatDTO.setArtNo(artNo);	//채팅하게된 게시글 번호 넣기
				chatDTO.setChatId(chatId);
				
				//List<ArticleVO> a = getArtDTO(artNo);  //articleNo로 articleDTO가져오기 메서드 이름 getArtDTO
				chatDTO.setToId(a.get(0).getUserId());	//DTO에 toId 넣어주기
				
				System.out.println(articleNo);
				System.out.println("채팅 정보 넣기");
				System.out.println(chatDTO.getChatContent());
				chatService.insertContent(chatDTO);  //db에 채팅DTO 넣기
				
				
				//지금까지 채팅한거 model로 옮기기
				//지금까지 채팅한 목록 가져오기
				//그 넘버에 맞는 ChatDTO 가져오기
				
				List<ChatDTO> chatView = chatService.chatView(chatId); //chatList 옮김
				session.setAttribute("session", chatView);
				
				//ArrayList<ChatDTO> chatView = (ArrayList<ChatDTO>) chatVieww;
				
				
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("artData",a);//넘겨줄 이름, 데이터
				mav.addObject("chatView",chatView);
				
				
				model.addAttribute("chatView", chatView);
				System.out.println("이것이 모델이다."+model);
				
				return "/chat/chattingview";
	
	}
	
	//방 만들기 makeRoom
	@ResponseBody
	@RequestMapping(value="/makeRoom", method=RequestMethod.POST)
	public String makeRoom(@RequestBody ChatListDTO chatListDTO)throws Exception{
			//채팅방 만들기
			System.out.println("#################여기로 와"+chatListDTO);
			int chatId = chatService.insertChatList(chatListDTO);//채팅방 번호 내놓기
			System.out.println("이거다####################################"+chatId);
		
		return "/chat/chattingview?chatId="+chatId;
		
	}
	
}
