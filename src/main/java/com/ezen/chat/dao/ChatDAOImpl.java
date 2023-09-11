package com.ezen.chat.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.board.dto.ArticleVO;
import com.ezen.chat.controller.ChatController;
import com.ezen.chat.dto.ChatDTO;
import com.ezen.chat.dto.ChatListDTO;

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
	public List<ArticleVO> getArtDTO(int artNo) throws Exception {
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
	public ArticleVO findArticleVOFromArtNo(int artNo,String status) throws Exception {
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

	

	
	
	
	

	
	
	
	
	

}
