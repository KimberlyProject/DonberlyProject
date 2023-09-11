package com.ezen.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.admin.dao.AdminDAO;
import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adminDAO;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 목록
	//--------------------------------------------------------------------------------------------------	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		
		return adminDAO.selectMember();
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 상세 정보
	//--------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO memberDetail(String userId) throws Exception {
		
		return adminDAO.memberDetail(userId);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원 정보 수정 Service");
		adminDAO.memberUpdate(memberDTO);
		
	}

	//--------------------------------------------------------------------------------------------------
	// 회원 삭제
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberDelete(String memberDTO) throws Exception {

		logger.info("회원 정보 수정 Service ==> " + memberDTO);
		
		adminDAO.memberDelete(memberDTO);
		
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 7일 정지
	//--------------------------------------------------------------------------------------------------
	@Override
	public void Asuspension(String userId) throws Exception {
		logger.info("회원 3일 정지 Service ==> " + userId);
		
		adminDAO.Asuspension(userId);
		
	}
	
	//--------------------------------------------------------------------------------------------------
	// 회원 영구 정지
	//--------------------------------------------------------------------------------------------------
	@Override
	public void Psuspension(String userId) throws Exception {
		logger.info("회원 3일 정지 Service ==> " + userId);
		
		adminDAO.Psuspension(userId);
		
	}
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 생성
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<CcenterDTO> listOneOnOne() throws Exception {
		List<CcenterDTO> listOneOnOne = adminDAO.listOneOnOne();
		return listOneOnOne;
	}
	

}
