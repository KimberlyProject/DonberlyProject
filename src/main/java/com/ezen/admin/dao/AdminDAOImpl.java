package com.ezen.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezen.admin.mapper.adminMapper";
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		
		return sqlSession.selectList(namespace + ".selectMember");
	}

	//--------------------------------------------------------------------------------------------------
	// public MemberDTO memberDetail(String id) throws Exception : 회원아이디에 해당하는 상세 정보 조회
	//--------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO memberDetail(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", userId);
	}

	//--------------------------------------------------------------------------------------------------
	// public void memberUpdate(MemberDTO memberDTO) throws Exception : 회원정보 수정 POST
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		logger.info("회원정보수정 DAO ==> " + memberDTO);
		sqlSession.update(namespace + ".update", memberDTO);
		
	}

	//--------------------------------------------------------------------------------------------------
	// public void memberDelete(String memberDTO) throws Exception : 회원정보 삭제 POST
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberDelete(String memberDTO) throws Exception {
		
		logger.info("회원정보삭제 DAO ==> " + memberDTO);
		sqlSession.delete(namespace + ".delete", memberDTO);
		
	}
	

	@Override
	public List<CcenterDTO> listOneOnOne() throws Exception {
		List<CcenterDTO> listOneOnOne = sqlSession.selectList(namespace + ".listOneOnOne");
		
		System.out.println("1:1문의 정보: " + listOneOnOne);
		return listOneOnOne;
	}
	
}
