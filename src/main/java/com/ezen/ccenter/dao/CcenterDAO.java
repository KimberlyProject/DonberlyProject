package com.ezen.ccenter.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("ccenterDAO")
public class CcenterDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.ccenter.mappers.ccenterMapper";
	
	// 1대1 문의하기 DAO
	private int selectNewArticleNO() throws DataAccessException {
		System.out.println("1대1문의 번호 생성 실행");
		return sqlSession.selectOne(namespace + ".selectNewArticleNO");
	}
	
	public int addNewAsk(Map<String, Object> articleMap) throws DataAccessException {

		int articleNo	= selectNewArticleNO();	// 새로 입력할 게시글의 번호를 가져온다.
		System.out.println("새로운 게시글 번호 추출하기 : " + articleNo);
		
		articleMap.put("articleNo", articleNo);
		
		System.out.println("정보들" + articleMap);
		
		sqlSession.insert(namespace + ".addNewAsk", articleMap); //article>> 보내는 데이터 타입
		
		return articleNo;
	}
	
	// 신고하기 DAO
	private int selectArticleNO() throws DataAccessException {
		System.out.println("신고하기 번호 생성 실행");
		return sqlSession.selectOne(namespace + ".selectArticleNO");
	}
	
	public int addNewReport(Map<String, Object> articleMap) throws DataAccessException {

		int articleNo	= selectArticleNO();	// 새로 입력할 게시글의 번호를 가져온다.
		System.out.println("새로운 게시글 번호 추출하기 : " + articleNo);
		
		articleMap.put("articleNo", articleNo);
		
		System.out.println("정보들" + articleMap);
		
		sqlSession.insert(namespace + ".addNewReport", articleMap); //article>> 보내는 데이터 타입
		
		return articleNo;
	}
			
}
