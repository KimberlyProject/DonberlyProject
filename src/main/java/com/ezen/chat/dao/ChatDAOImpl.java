package com.ezen.chat.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.chat.controller.ChatController;
import com.ezen.chat.dto.ChatDTO;

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
	

	
	
	
	
	

}
