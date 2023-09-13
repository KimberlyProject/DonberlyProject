package com.ezen.chat.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import com.ezen.board.dto.BuyArticleVO;
import com.ezen.auction.dto.AuctionDTO;

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
	public List<BuyArticleVO> getArtDTO(int artNo) throws Exception {
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
	public BuyArticleVO findArticleVOFromArtNo(int artNo,String status) throws Exception {
		
		return chatDAO.findArticleVOFromArtNo(artNo,status);
	}

	@Override
	public List<ChatDTO> findLastChat() throws Exception {
		System.out.println("서버스*******************************");
		return chatDAO.findLastChat();
	}

	@Override
	public void deleteChatRoom(int chatId) throws Exception {
		chatDAO.deleteChatRoom(chatId);
		
	}

	@Override
	public String find_nickname(String memberId) throws Exception {
		
		return chatDAO.find_nickname(memberId);
	}

	@Override
	public List<BuyArticleVO> findAllMemeber() throws Exception {
		
		return chatDAO.findAllMemeber();
	}

	@Override
	public AuctionDTO findAuctionDTOFromArtNo(int artNo, String status) throws Exception {
		System.out.println("서비스에요!!!!!!!!!!!!!!!!!!!aaaaaaaaaaaaaaaaaaaa");
		return chatDAO.findAuctionDTOFromArtNo(artNo,status);
	}

	@Override
	public void readChat(ChatDTO chatDTO) throws Exception {
		chatDAO.readChat(chatDTO);
		
	}

	@Override
	public int countChat(String userId, int chatId) throws Exception {
		
		return chatDAO.countChat(userId,chatId);
	}

	
	
	
	
	
	
	
	

}
