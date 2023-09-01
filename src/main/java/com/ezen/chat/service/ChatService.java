package com.ezen.chat.service;

import java.util.List;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;

public interface ChatService {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
	
	public List<ArticleVO> getArtDTO(int artNo) throws Exception;
	
	public void insertChatList(ChatListDTO chatListDTO) throws Exception;
}
