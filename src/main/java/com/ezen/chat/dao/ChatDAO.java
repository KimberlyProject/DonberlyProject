package com.ezen.chat.dao;

import java.util.List;

import javax.swing.text.DefaultEditorKit.InsertContentAction;

import com.ezen.chat.dto.ChatDTO;



public interface ChatDAO {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
}

