package com.ezen.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.admin.dao.AdminDAO;
import com.ezen.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adminDAO;
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception; : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		
		return adminDAO.selectMember();
	}
	
	//--------------------------------------------------------------------------------------------------
	// public MemberDTO memberDetail(String id) throws Exception : 회원 상세 정보
	//--------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO memberDetail(String userId) throws Exception {
		
		return adminDAO.memberDetail(userId);
	}
	
	//--------------------------------------------------------------------------------------------------
	// public void memberUpdate(MemberDTO memberDTO) throws Exception : 회원 정보 수정
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원 정보 수정 Service");
		adminDAO.memberUpdate(memberDTO);
		
	}

	@Override
	public void memberDelete(String memberDTO) throws Exception {

		logger.info("회원 정보 수정 Service ==> " + memberDTO);
		
		adminDAO.memberDelete(memberDTO);
		
	}

}
