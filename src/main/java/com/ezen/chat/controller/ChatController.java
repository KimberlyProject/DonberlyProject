package com.ezen.chat.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String chattingview() throws Exception{
		System.out.println("채팅 입장");
		return "chat/chattingview";
	}
	/*
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content, Model model) throws Exception{
		System.out.println("채팅 정보 넣기");
		System.out.println(content);
		
		chatService.insertContent(content);
	}*/
	
	@RequestMapping(value="/chattingview", method=RequestMethod.POST)
	public void chattingview(@RequestParam(value="content", required=false) String content,@RequestParam(value="fromId", required=false) String fromId, Model model) throws Exception{
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setChatContent(content);
		chatDTO.setFromId(fromId);
		System.out.println("채팅 정보 넣기");
		System.out.println(chatDTO.getChatContent());
		
		chatService.insertContent(chatDTO);
		
	}
	
	@RequestMapping(value="/chat_list", method=RequestMethod.GET)
	public String ChatList(Model model){
		System.out.println("채팅 입장");
		return "chat/chat_list";
	}
}
