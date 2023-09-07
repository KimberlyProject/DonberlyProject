package com.ezen.chat.dao;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.DefaultEditorKit.InsertContentAction;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;



public interface ChatDAO {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
	
	public List<ArticleVO> getArtDTO(int artNo) throws Exception;
	
	public int insertChatList(ChatListDTO chatListDTO) throws Exception;
	
	public List<ChatListDTO> listChat(String userId) throws Exception;
	
	public List<ChatDTO> chatView(int chatId) throws Exception;
	
	public ChatListDTO findChatListFromChatId(int chatId) throws Exception;
	
	public ChatDTO findContent(ChatDTO chatDTO) throws Exception;
	
	public ArticleVO findArticleVOFromArtNo(int artNo,String status) throws Exception;
	
	public List<ChatDTO> findLastChat(String userId)throws Exception;
}

