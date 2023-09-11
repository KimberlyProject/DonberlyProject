package com.ezen.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.mypage.dto.CalendarDTO;
import com.ezen.mypage.service.MypageService;

@Repository("mypageDAO")
public class MypageDAO {

	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezen.mypage.mappers.mypageMapper";
	
	public List<CalendarDTO> calendarList(String userId)  throws DataAccessException{
		logger.info("Calendar 리스트가져오기 DAO");
		return sqlSession.selectList(namespace + ".calendarlist", userId);
	}
}
