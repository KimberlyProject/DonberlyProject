package com.ezen.chat.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.service.ChatService;



@Controller
@RequestMapping("/chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Inject
	private ChatService chatService;
	@Inject
	private ChatDAO chatDAO;
	
	@RequestMapping(value="/chattingview", method=RequestMethod.GET)
	public String Chatting(Model model) throws Exception{
		List<ChatDTO> chatList = chatService.selectChat();
		model.addAttribute("chatList",chatList);
		System.out.println("채팅 입장");
		return "chat/chattingview";
	}
	
	@RequestMapping(value="/chat_list", method=RequestMethod.GET)
	public String ChatList(Model model){
		System.out.println("채팅 입장");
		return "chat/chat_list";
	}
}
