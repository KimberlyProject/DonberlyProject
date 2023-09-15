package com.ezen.chat.service;

import java.util.ArrayList;
import java.util.List;


import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.auction.dto.AuctionDTO;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;
import com.ezen.member.dto.MemberDTO;

public interface ChatService {

	public List<ChatDTO> selectChat() throws Exception;
	
	public void insertContent(ChatDTO chatDTO) throws Exception;
	
	public List<BuyArticleDTO> getArtDTO(int artNo) throws Exception;
	
	public int insertChatList(ChatListDTO chatListDTO) throws Exception;
	
	public List<ChatListDTO>listChat(String userId)throws Exception;
	
	public List<ChatDTO>chatView(int chatId) throws Exception;
	
	public ChatListDTO findChatListFromChatId(int chatId) throws Exception;
	
	public ChatDTO findContent(ChatDTO chatDTO) throws Exception;
	
	public BuyArticleDTO findArticleVOFromArtNo(int artNo,String status) throws Exception;
	
	public List<ChatDTO> findLastChat() throws Exception;
	
	public void deleteChatRoom(int chatId) throws Exception;
	
	public String find_nickname(String memberId) throws Exception;
	
	public List<BuyArticleDTO> findAllMemeber() throws Exception;
	
	public AuctionDTO findAuctionDTOFromArtNo(int artNo, String status) throws Exception;
	
	public void readChat(ChatDTO chatDTO) throws Exception;
	
	public List countChat(String userId) throws Exception;
	
	public String finduserIdFromNickname(String nickName) throws Exception;
	
	public List<MemberDTO> findMemberDTO() throws Exception;
}
