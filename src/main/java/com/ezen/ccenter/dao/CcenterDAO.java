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
	
	
	private int selectNewArticleNO() throws DataAccessException {
		System.out.println("1대1문의 번호 생성 실행");
		return sqlSession.selectOne(namespace + ".selectNewArticleNO");
	}
	
	public int addNewAsk(Map articleMap) throws DataAccessException {

		int articleNO	= selectNewArticleNO();	// 새로 입력할 게시글의 번호를 가져온다.
		System.out.println("새로운 게시글 번호 추출하기 : " + articleNO);
		articleMap.put("articleNO", articleNO);
		
		sqlSession.insert(namespace + ".addNewAsk", articleMap);
		
		return articleNO;
	}
			
}
