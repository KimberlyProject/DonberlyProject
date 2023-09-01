package com.ezen.chat.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;
import com.ezen.chat.service.ChatService;




@Controller
@RequestMapping("/chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Inject
	private ChatService chatService;
	@Inject
	private ChatDAO chatDAO;
	private ChatListDTO chatListDTO;
	/*
	//채팅 리스트 만들기
	@RequestMapping(value="/chat_list",method=RequestMethod.GET)
	public void makeChatList(@RequestParam(value="content", required=false) String content,
	@RequestParam(value="fromId", required=false) String fromId,
	@RequestParam(value="articleNo",required=false) String articleNo, Model model) throws Exception{
		
		System.out.println("#################여기로 와");
		ChatListDTO chatListDTO = new ChatListDTO();
		String status = articleNo.substring(0,1);
		int artNo;
		artNo = Integer.parseInt(articleNo.substring(1));
		chatListDTO.setArtNo(artNo); //게시글 번호  
		chatListDTO.setChatId(artNo); //채팅방 번호 (하나씩 늘어야해요)
		List<ArticleVO> a = getArtDTO(artNo);  //articleNo로 articleDTO가져오기 메서드 이름 getArtDTO
		if(status.equals("s")) {
			//판매게시판에서 채팅하는거니까 상대가 판매자 내가 구매자
			logger.info("안녕하세요 여긴 구매자 들어왓어요");
			chatListDTO.setBuyer(fromId); //구매자인 나
			chatListDTO.setSeller(a.get(0).getUserId()); //판매자 
		}
		else if(status.equals("b")) {
			//구매게시판에서 채팅하는거니까 상대가 구매자 내가 판매자
			chatListDTO.setSeller(fromId); //구매자인 나
			chatListDTO.setBuyer(a.get(0).getUserId()); //판매자
		}
		chatService.insertChatList(chatListDTO);
		
		
		
		//return "redirect:/board/viewArticle?articleNO="+artNo;
		
	}
	*/
	
	//채팅창 GET
	@RequestMapping(value="/chattingview", method=RequestMethod.GET)
	public String chattingview(String articleNo) throws Exception{
		/*판매 게시판에서 넘어오면 articleNo앞에 s가 붙음 s1,s2...*/
		int artNo = Integer.parseInt(articleNo.substring(1));
		
		System.out.println("채팅 입장");
		return "/chat/chattingview";
	}
	/*
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content, Model model) throws Exception{
		System.out.println("채팅 정보 넣기");
		System.out.println(content);
		
		chatService.insertContent(content);
	}*/
	//채팅창 POST
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content,@RequestParam(value="fromId", required=false) String fromId,@RequestParam(value="articleNo", required=false) String articleNo, Model model ) throws Exception{
		
		
		
		//채팅방 만들기
		System.out.println("#################여기로 와");
		ChatListDTO chatListDTO = new ChatListDTO();
		String status = articleNo.substring(0,1);
		int artNo;
		artNo = Integer.parseInt(articleNo.substring(1));
		chatListDTO.setArtNo(artNo); //게시글 번호  
		chatListDTO.setChatId(artNo); //채팅방 번호 (하나씩 늘어야해요)
		List<ArticleVO> a = getArtDTO(artNo);  //articleNo로 articleDTO가져오기 메서드 이름 getArtDTO
		//model.addAttribute("chat", chatListDTO);
		//model.addAttribute("articleD", a);
		
		
		if(status.equals("s")) {
			//판매게시판에서 채팅하는거니까 상대가 판매자 내가 구매자
			logger.info("안녕하세요 여긴 구매자 들어왓어요");
			chatListDTO.setBuyer(fromId); //구매자인 나
			chatListDTO.setSeller(a.get(0).getUserId()); //판매자 
		}
		else if(status.equals("b")) {
			//구매게시판에서 채팅하는거니까 상대가 구매자 내가 판매자
			chatListDTO.setSeller(fromId); //구매자인 나
			chatListDTO.setBuyer(a.get(0).getUserId()); //판매자
		}
		chatService.insertChatList(chatListDTO);
		//채팅방 만들기 끝
		
		
		
		
		ChatDTO chatDTO = new ChatDTO();
		//ChatListDTO chatListDTO = new ChatListDTO();
		//int artNo = Integer.parseInt(articleNo.substring(1));//앞에 붙은 식별자를 삭제
		chatDTO.setChatContent(content);
		chatDTO.setFromId(fromId);
		chatDTO.setArtNo(artNo);
		
		//List<ArticleVO> a = getArtDTO(artNo);  //articleNo로 articleDTO가져오기 메서드 이름 getArtDTO
		chatDTO.setToId(a.get(0).getUserId());	//DTO에 toId 넣어주기
		
		System.out.println(articleNo);
		System.out.println("채팅 정보 넣기");
		System.out.println(chatDTO.getChatContent());
		chatService.insertContent(chatDTO);
		
		
	}
	//값으로 articleDTO가져오기
	public List<ArticleVO> getArtDTO(int artNo)  throws Exception{
		List<ArticleVO> articleList = chatService.getArtDTO(artNo);
		System.out.println("######################"+articleList);
		return articleList;
	}
	
	//채팅 리스트
	@RequestMapping(value="/chat_list", method=RequestMethod.GET)
	public String ChatList(Model model){
		System.out.println("채팅 입장");
		return "chat/chat_list";
	}
}
