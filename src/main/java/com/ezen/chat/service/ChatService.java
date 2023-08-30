package com.ezen.chat.service;

import java.util.List;

import com.ezen.chat.dto.ChatDTO;

public interface ChatService {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
}
