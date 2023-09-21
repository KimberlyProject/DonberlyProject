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
import com.ezen.auction.dto.AucImgDTO;
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
		
		List<MemberDTO> memberDTO = chatService.findMemberDTO();
		
		//아티클 넘버로 아티클VO 가져오기

		if(chatListDTO.getStatus().equals("s") || chatListDTO.getStatus().equals("b")) { //status가 s,b인 경매장에서 생성된 채팅
			BuyArticleDTO articleVO = chatService.findArticleVOFromArtNo(artNo,chatListDTO.getStatus()); // 여기 dao에서 s b a 구별해서 가져옴
			System.out.println("************************************"+articleVO);
			session.setAttribute("session",articleVO);			
		}
		else if(chatListDTO.getStatus().equals("a")) { //status가 a인 경매장에서 생성된 채팅
			
			AuctionDTO auctionDTO = chatService.findAuctionDTOFromArtNo(artNo,chatListDTO.getStatus());// 여기 dao에서 s b a 구별해서 가져옴
			
			session.setAttribute("session",auctionDTO); 
			//경은추가
			int aucCode = auctionDTO.getAucCode();
			AucImgDTO aucImgDTO = chatService.findAucImgDTOFromAucCode(aucCode);
			session.setAttribute("aucimgsession", aucImgDTO);
		}

		session.setAttribute("chatList", chatListDTO);
		session.setAttribute("findNickname", memberDTO);
		System.out.println("채팅 입장");
		return "/chat/chattingview";
	}
	
	
	//채팅창 POST chatRead()넣기
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content,
			@RequestParam(value="fromId", required=false) String fromId,
			@RequestParam(value="chatId", required=false) String chatId,
			HttpServletRequest request, HttpServletResponse response) throws Exception{		
		//세션 가져오기
		HttpSession session	= request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		int ch = Integer.parseInt(chatId);
		//채팅방 넘버로 chatListDTO 찾기, status로 구별해서 to랑 from 넣기
		ChatListDTO chatListDTO = chatService.findChatListFromChatId(ch);
		
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setArtNo(chatListDTO.getArtNo());	//채팅이 연결된 게시판 번호 넣기
		chatDTO.setChatId(ch);						//채팅 방 번호 넣기
		chatDTO.setFromId(fromId);					//보내는 사람 넣기
		chatDTO.setChatContent(content); 			//채팅 내용 넣기
		chatDTO.setChatRead(1); 					//chatRead는 1이 기본(보지 않은 상태)
		//파는사람과 내가 같으면 사는사람이 
		if(fromId.equals(chatListDTO.getSeller())) { 
			chatDTO.setToId(chatListDTO.getBuyer());
		}
		else if(fromId.equals(chatListDTO.getBuyer())) {
			chatDTO.setToId(chatListDTO.getSeller());
		}
		
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
		
		List<ChatListDTO> chatList = chatService.listChat(userId); //chatList 옮김
		
		//최근한거 가져오기 채팅방 넘버 별로 최근꺼
		List<ChatDTO> lastchat = chatService.findLastChat(); 
		
		//닉네임 찾기
		List<BuyArticleDTO> memberList = chatService.findAllMemeber();
		//채팅방마다 나에게 온 채팅의 개수
		List<ChatDTO> count= chatService.countChat(userId);
		
		
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("chatList",chatList);//넘겨줄 이름, 데이터 채팅방 목록
		mav.addObject("lastChat",lastchat);//마지막 채팅
		mav.addObject("nickname",memberList);//닉네임 담은 리스트
		mav.addObject("count",count);
		
		return mav;		
		
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
	//방 만들기 makeRoom2 (auction 버전)
		@ResponseBody
		@RequestMapping(value="/makeRoom2", method=RequestMethod.POST)
		public String makeRoom2(@RequestBody ChatListDTO chatListDTO)throws Exception{
				//채팅방 만들기
				System.out.println("#################여기로 와"+chatListDTO);
				//닉네임으로 id찾기 구매자가 닉네임으로 되어있어서
				String userId = chatService.finduserIdFromNickname(chatListDTO.getBuyer());
				chatListDTO.setBuyer(userId);
				System.out.println("찾은 userId"+userId);
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
	public List<ChatDTO> getChat(@RequestParam(value="chatId", required=false) String chatId,
			@RequestParam(value="fromId", required=false) String fromId,HttpServletRequest request)throws Exception {
		HttpSession session= request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		int ch = Integer.parseInt(chatId);
		
		//toId가 내 아이디인 데이터가 있다면 그걸 0으로 바꿔라(읽었단 뜻이니까)
		readChat(memberDTO.getUserId(), ch); //읽었으면 chatRead를 0으로 바꿔줌
		List<ChatDTO> list =  chatService.chatView(ch); //ch 채팅방에 있는 모든 내용 가져오기
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
	
	//게시판 닉네임 가져오기
	@ResponseBody
	@RequestMapping(value="/find_nickname", method=RequestMethod.POST, produces = "application/text; charset=utf8" )
	public String find_nickname(@RequestParam(value="memberId", required=false) String memberId) throws Exception{
		String nickname = chatService.find_nickname(memberId);
		//System.out.println("----------------------------------------------------------" + memberId);
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + nickname);
		return nickname;
	}
	
	//채팅 읽었는지 확인하기 db에 칼럼 넣기
	public void readChat(String toId, int chatId) throws Exception{
		
		ChatDTO chatDTO = new ChatDTO();
		
		chatDTO.setToId(toId);
		chatDTO.setChatId(chatId);
		chatService.readChat(chatDTO); //chatRead를 0으로 바꿔줌
	}
	//안읽은 채팅의 개수
	public List countChat(String userId) throws Exception{
		List count = chatService.countChat(userId); //안읽은 채팅 개수 전부 가져오기
		//System.out.println("안읽은 개수!!!!!!!!!*********"+count);
		
		return count;
	}
	
	//채팅 알람
	@ResponseBody
	@RequestMapping(value="/alarm", method=RequestMethod.POST)
	public List<ChatDTO> chatAlarm(HttpServletRequest request, Model model) throws Exception{
		HttpSession session= request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String userId = memberDTO.getUserId();
		List<ChatDTO> chatDTO = chatService.getAlarm(userId);
		//model.addAttribute("alarm", chatDTO);
		//System.out.println("왜 안돼애애애애애애애 챗디티오"+chatDTO);
		//session.setAttribute("chatAlarm", chatDTO);
		return chatDTO;
	}
		
	
}
