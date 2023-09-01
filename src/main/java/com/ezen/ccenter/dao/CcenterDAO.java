package com.ezen.ccenter.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class CcenterDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.ccenter.mappers.ccenterMapper";
	
	
	// 고객센터 내 1:1문의 -> 새로운 1:1문의 글 추가하기
	public int insertNewAsk(Map articleMap) throws DataAccessException {
		System.err.println("1:1 문의 글 업로드 dao");
		int aucCode = selectNewAucCode();
		articleMap.put("aucCode", aucCode);
		System.out.println("dao에서 aucCode 생성" + aucCode);
		sqlSession.insert(namespace + ".insertNewAsk", articleMap);
		return aucCode;
	}		//aucCode 생성하기
			private int selectNewAucCode() throws DataAccessException {
				return sqlSession.selectOne(namespace +".selectNewAucCode");
			}
			
}
