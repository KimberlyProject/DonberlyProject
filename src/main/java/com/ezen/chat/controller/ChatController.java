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


import com.ezen.board.dto.BuyArticleDTO;

import com.ezen.auction.dto.AuctionDTO;

import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;
import com.ezen.chat.service.ChatService;
import com.ezen.member.dto.MemberDTO;




@Controller
@RequestMapping("/chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	

	@Inject
	private ChatService chatService;
	@Inject
	private ChatDAO chatDAO;
	private ChatListDTO chatListDTO;
	
	
	//채팅창 GET articleVO 세션으로 보여주기
	@RequestMapping(value="/chattingview", method=RequestMethod.GET)
	public String chattingview(String chatId, HttpServletRequest request) throws Exception{
		
		
		
		HttpSession session= request.getSession();
		int ch = Integer.parseInt(chatId);
		ChatListDTO chatListDTO = chatService.findChatListFromChatId(ch); //chatList 옮김
		int artNo = chatListDTO.getArtNo();
		
		//아티클 넘버로 아티클VO 가져오기

		if(chatListDTO.getStatus().equals("s") || chatListDTO.getStatus().equals("b")) {
			BuyArticleDTO articleVO = chatService.findArticleVOFromArtNo(artNo,chatListDTO.getStatus()); // 여기 dao에서 s b a 구별해서 가져옴
			System.out.println("************************************"+articleVO);
			session.setAttribute("session",articleVO);			
		}
		else if(chatListDTO.getStatus().equals("a")) {
			System.out.println("************************************"+"여기와라66666666666666");
			AuctionDTO auctionDTO = chatService.findAuctionDTOFromArtNo(artNo,chatListDTO.getStatus());// 여기 dao에서 s b a 구별해서 가져옴
			System.out.println("************************************"+auctionDTO);
			session.setAttribute("session",auctionDTO);
		}

		session.setAttribute("chatList", chatListDTO);
		System.out.println("채팅 입장");
		return "/chat/chattingview";
	}
	
	
	//채팅창 POST
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content,
			@RequestParam(value="fromId", required=false) String fromId,
			@RequestParam(value="chatId", required=false) String chatId,
			Model model,HttpServletRequest request, HttpServletResponse response,RedirectAttributes attr) throws Exception{

		System.out.println(content+fromId+chatId);
		
		int ch = Integer.parseInt(chatId);
		//ch로 chatListDTO 찾기 찾아서 스테이터스로 구별해서 to랑 from 넣기
		ChatListDTO chatListDTO = chatService.findChatListFromChatId(ch);
		
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setArtNo(chatListDTO.getArtNo());
		chatDTO.setChatId(ch);
		chatDTO.setFromId(fromId);
		chatDTO.setChatContent(content);
		//파는사람과 내가 같으면 사는사람이 
		if(fromId.equals(chatListDTO.getSeller())) {
			chatDTO.setToId(chatListDTO.getBuyer());
		}
		else if(fromId.equals(chatListDTO.getBuyer())) {
			chatDTO.setToId(chatListDTO.getSeller());
		}
		//System.out.println("################################chatDTO"+chatDTO);
		chatService.insertContent(chatDTO);  //db에 채팅DTO 넣기
		
	}
	
	//값으로 articleDTO가져오기
	public List<BuyArticleDTO> getArtDTO(int artNo)  throws Exception{
		List<BuyArticleDTO> articleList = chatService.getArtDTO(artNo);
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
		
		
		List<ChatListDTO> chatList = chatService.listChat(userId); //chatList 옮김
		
		//최근한거 가져오기 채팅방 넘버 별로 최근꺼
		List<ChatDTO> lastchat = chatService.findLastChat(); 
        //System.out.println("여기까지는 나오나" + lastchat);
		//System.out.println("채팅 리스트*******************"+lastchat);
		
		//닉네임 찾기
		List<BuyArticleDTO> memberList = chatService.findAllMemeber();
		
		System.out.println(memberList);
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("lastChat", lastchat.getLastChat());
		//System.out.println(lastchat);
		mav.addObject("chatList",chatList);//넘겨줄 이름, 데이터
		mav.addObject("lastChat",lastchat);//마지막 채팅
		mav.addObject("nickname",memberList);
		//mav.addObject("",);
		//viewName이 없기 때문에 URL로 부터 뷰 이름을 검색한다.
		// /board/listArticlres.do => /vboard/listArticles
		//System.out.println("채팅 입장");
		return mav;		//리턴에 경로 없으면 value값에 do빼서 알아서 찾아간다.
		
	}
	
	
	//방 만들기 makeRoom
	@ResponseBody
	@RequestMapping(value="/makeRoom", method=RequestMethod.POST)
	public String makeRoom(@RequestBody ChatListDTO chatListDTO)throws Exception{
			//채팅방 만들기
			System.out.println("#################여기로 와"+chatListDTO);
			if(chatListDTO.getSeller()!=null && chatListDTO.getBuyer()!=null) {
				int chatId = chatService.insertChatList(chatListDTO);//채팅방 번호 내놓기				
				//System.out.println("이거다####################################"+chatId);
				return "/chat/chattingview?chatId="+chatId;
			}
			else {
				return "";
			}
		
		
	}
	//getChat
	@ResponseBody
	@RequestMapping(value="/getChat", method=RequestMethod.POST)
	public List<ChatDTO> getChat(@RequestParam(value="chatId", required=false) String chatId,@RequestParam(value="fromId", required=false) String fromId)throws Exception {
		ChatDTO chatDTO1 = new ChatDTO();
		ChatDTO chatDTO2 = new ChatDTO(); //chatDTO2가 최근 녀석
		int ch = Integer.parseInt(chatId);
		chatDTO1.setChatId(ch);
		chatDTO1.setFromId(fromId);
		//fromId가 toId인 chatDTO 찾기
		chatDTO2 = chatService.findContent(chatDTO1);
		//System.out.println("**************************챗아이디="+chatId+"프롬아이디="+fromId+"가장 최근 컨텐츠"+newchatDTO.getChatContent()+"이번에 쓴 컨텐츠"+chatDTO2.getChatContent());
		//System.out.println(chatDTO2);
		
		List<ChatDTO> list =  chatService.chatView(ch);
		System.out.println(list);
		return list;
		
		
	}
	
	//채팅방과 채팅내용 지우기
	@ResponseBody
	@RequestMapping(value="/outChat", method=RequestMethod.POST)
	public void outChat(@RequestParam(value="chatId", required=false) String chatId) throws Exception{
		int ch = Integer.parseInt(chatId);
		chatService.deleteChatRoom(ch);
	}
	
	@ResponseBody
	@RequestMapping(value="/find_nickname", method=RequestMethod.POST, produces = "application/text; charset=utf8" )
	public String find_nickname(@RequestParam(value="memberId", required=false) String memberId) throws Exception{
		String nickname = chatService.find_nickname(memberId);
		System.out.println("----------------------------------------------------------" + memberId);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + nickname);
		return nickname;
	}
	
	
}
