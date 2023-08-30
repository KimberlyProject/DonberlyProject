package com.ezen.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.chat.controller.ChatController;
import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;

@Service
public class ChatServiceImpl implements ChatService {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	
	@Inject
	private ChatDAO chatDAO;
	
	@Override
	public List<ChatDTO> selectChat() throws Exception {
		// TODO Auto-generated method stub
		return chatDAO.selectChat();
	}

	@Override
	public String insertContent(String content) throws Exception {
		// TODO Auto-generated method stub
		return chatDAO.insertContent(content);
	}
	
	
	
	
	
	

}
