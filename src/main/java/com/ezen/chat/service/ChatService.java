package com.ezen.chat.service;

import java.util.ArrayList;
import java.util.List;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;

public interface ChatService {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
	
	public List<ArticleVO> getArtDTO(int artNo) throws Exception;
	
	public int insertChatList(ChatListDTO chatListDTO) throws Exception;
	
	public List<ChatListDTO>listChat(String userId)throws Exception;
	
	public List<ChatDTO>chatView(int chatId) throws Exception;
}
