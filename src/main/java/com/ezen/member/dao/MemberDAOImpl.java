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

	// 회원 아이디 중복 검사
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImple 아이디 중복 검사");
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);
	} // End - public int idCheck(MemberDTO memberDTO)
	
	// 아이디 찾기
	@Override
	public String findId(MemberDTO memberDTO) throws Exception {		
		return sqlSession.selectOne(namespace + ".findId", memberDTO);
	}
	
	// 비밀번호 찾기
	@Override
	public String findPasswd(MemberDTO memberDTO) throws Exception {		
		return sqlSession.selectOne(namespace + ".findPasswd", memberDTO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원 가입 POST
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int membership(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImple 회원 가입 POST");
		return sqlSession.insert(namespace + ".insert", memberDTO);
	} // End - public int memberInsert(MemberDTO memberDTO)

	// 닉네임 중복 검사
	@Override
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImple 닉네임 중복 검사");
		return sqlSession.selectOne(namespace + ".nickCheck", memberDTO);
	}
	
	
	@Override
	public void memberDelete(MemberDTO memberDTO) throws Exception {
		sqlSession.delete(namespace + ".delete", memberDTO.getUserId());
	}


}
