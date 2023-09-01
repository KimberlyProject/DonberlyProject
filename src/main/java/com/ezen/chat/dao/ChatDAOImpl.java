package com.ezen.chat.dao;

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
	public void insertChatList(ChatListDTO chatListDTO) throws Exception {
		
		int chatId = selectNewChatId();
		
		chatListDTO.setChatId(chatId);
		sqlSession.insert(namespace+".insertChatList", chatListDTO);
		
	}
	
	
	//--------------------------------------------------
	// 새로운 게시글 번호 추출하기
	//--------------------------------------------------
	private int selectNewChatId() throws DataAccessException{
		return sqlSession.selectOne(namespace + ".selectNewChatId");
	}
	
	

	
	
	
	
	

}
