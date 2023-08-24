package com.ezen.chat.dao;

import java.util.List;

import com.ezen.chat.dto.ChatDTO;



public interface ChatDAO {

	public List<ChatDTO> selectChat() throws Exception;
}
