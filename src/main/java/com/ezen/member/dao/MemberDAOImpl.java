package com.ezen.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.ezen.member.mapper.memberMapper";
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	//경은
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImpl 로그인 POST");
		return sqlSession.selectOne(namespace + ".login", memberDTO);
	}//경은 logOn()

}
