package com.ezen.chat.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.board.dao.BoardDAOImpl;
import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.controller.ChatController;
import com.ezen.chat.dao.ChatDAO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;

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
	public void insertContent(ChatDTO chatDTO) throws Exception {
		// TODO Auto-generated method stub
		chatDAO.insertContent(chatDTO);
	}

	@Override
	public List<ArticleVO> getArtDTO(int artNo) throws Exception {
		// TODO Auto-generated method stub
		return chatDAO.getArtDTO(artNo);
	}

	@Override
	public int insertChatList(ChatListDTO chatListDTO) throws Exception {
		return chatDAO.insertChatList(chatListDTO);
		
	}

	@Override
	public List<ChatListDTO> listChat(String userId) throws Exception {
		
		return chatDAO.listChat(userId);
	}
	//채팅방 번호로 채팅내용 다 가져오기
	@Override
	public List<ChatDTO> chatView(int chatId) throws Exception {
		
		return chatDAO.chatView(chatId);
	}

	@Override
	public ChatListDTO findChatListFromChatId(int chatId) throws Exception {
		
		return chatDAO.findChatListFromChatId(chatId);
	}

	@Override
	public ChatDTO findContent(ChatDTO chatDTO) throws Exception {
		
		return chatDAO.findContent(chatDTO);
	}

	@Override
	public ArticleVO findArticleVOFromArtNo(int artNo,String status) throws Exception {
		
		return chatDAO.findArticleVOFromArtNo(artNo,status);
	}

	
	
	
	
	
	
	
	

}
