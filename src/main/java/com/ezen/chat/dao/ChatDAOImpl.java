package com.ezen.chat.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;



import com.ezen.board.dto.BuyArticleDTO;
import com.ezen.auction.dto.AuctionDTO;

import com.ezen.chat.controller.ChatController;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;
import com.ezen.member.dto.MemberDTO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	//-----------------------------------------------------------------------------------------------------------
	// 컨트롤러는 서비스를 호출하고, 서비스는 DAO를 호출하고, DAO는 SqlSession을 호출한다.
	//-----------------------------------------------------------------------------------------------------------
	@Inject
	private	SqlSession sqlSession;
	
	private static final String namespace = "com.ezen.chat.mapper.ChatMapper";
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원 전체 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ChatDTO> selectChat() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectChat");
	}

	@Override
	public void insertContent(ChatDTO chatDTO) throws Exception {
		
		sqlSession.insert(namespace+".insertContent", chatDTO);
		
	}

	@Override
	public List<BuyArticleDTO> getArtDTO(int artNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getArticle", artNo);
	}
	//chatlist 추가
	@Override
	public int insertChatList(ChatListDTO chatListDTO) throws Exception {
		
		if(checkChatId(chatListDTO) == 0) {
			int chatId = selectNewChatId();
			chatListDTO.setChatId(chatId);
			sqlSession.insert(namespace+".insertChatList", chatListDTO);
			return findChatId(chatListDTO);
		}
		else {
			logger.info("######################이미있어요");
			return findChatId(chatListDTO);
		}
		
	}
	
	
	//--------------------------------------------------
	// 새로운 채팅방 번호 추출하기
	//--------------------------------------------------
	private int selectNewChatId() throws DataAccessException{
		
		
		return sqlSession.selectOne(namespace + ".selectNewChatId");
	}
	
	//채팅방 번호 있는지 확인
	private int checkChatId(ChatListDTO chatListDTO) throws DataAccessException{
		return sqlSession.selectOne(namespace + ".checkChatId",chatListDTO);
	}
	
	private int findChatId (ChatListDTO chatListDTO) throws DataAccessException{
		return sqlSession.selectOne(namespace + ".findChatId",chatListDTO);
	}

	
	//채팅 리스트 띄우기
	@Override
	public List<ChatListDTO> listChat(String userId) throws Exception {
		
		return sqlSession.selectList(namespace+".listChat",userId);
	}

	@Override
	public List<ChatDTO> chatView(int chatId) throws Exception {
		
		return sqlSession.selectList(namespace+".chatView",chatId);
	}

	@Override
	public ChatListDTO findChatListFromChatId(int chatId) throws Exception {
		
		return sqlSession.selectOne(namespace+".findChatListFromChatId",chatId);
	}

	@Override
	public ChatDTO findContent(ChatDTO chatDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".findContent",chatDTO);
	}

	@Override
	public BuyArticleDTO findArticleVOFromArtNo(int artNo,String status) throws Exception {
		if(status.equals("s")) {
			return sqlSession.selectOne(namespace+".findArticleVOFromArtNoS",artNo);
			
		}
		else if(status.equals("b")) {
			return sqlSession.selectOne(namespace+".findArticleVOFromArtNoB",artNo);
		}
		
		else {
			return null;
		}
		
	}

	@Override
	public List<ChatDTO> findLastChat() throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace+".findLastChat");
	}

	@Override
	public void deleteChatRoom(int chatId) throws Exception {
		sqlSession.delete(namespace+".deleteChatRoom", chatId);
		sqlSession.delete(namespace+".deleteChatting", chatId);
		
	}

	@Override
	public String find_nickname(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_nickname",memberId);
	}

	@Override
	public List<BuyArticleDTO> findAllMemeber() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".findAllMemeber");
	}

	@Override
	public AuctionDTO findAuctionDTOFromArtNo(int artNo, String status) throws Exception {
		
		if(status.equals("a")) {
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa래요");
			return sqlSession.selectOne(namespace+".findAuctionDTOFromArtNoS",artNo);
		}
		else {
			return null;
		}
	}

	//채팅 읽은거 확인하고 변경
	@Override
	public void readChat(ChatDTO chatDTO) throws Exception {
		sqlSession.update(namespace+".readChat", chatDTO);
	}

	//채팅 안읽은거 개수
	@Override
	public List countChat(String userId) throws Exception {
		
		return sqlSession.selectList(namespace+".countChat",userId);
	}

	@Override
	public String finduserIdFromNickname(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".finduserIdFromNickname",nickName);
	}

	@Override
	public List<MemberDTO> findMemberDTO() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".findMemberDTO");
	}

	

	
	
	
	

	
	
	
	
	

}
