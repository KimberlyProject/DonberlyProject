package com.ezen.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.admin.dao.AdminDAO;
import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.Criteria;
import com.ezen.admin.dto.ReportCriteria;
import com.ezen.admin.dto.SearchCriteria;
import com.ezen.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adminDAO;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 조회 + 페이징 + 검색
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<MemberDTO> memberList(Criteria cri) throws Exception {
		return adminDAO.memberList(cri);
		
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
	// 1:1 문의하기 전체 조회 + 검색
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<CcenterDTO> listOneOnOne(SearchCriteria cri) throws Exception {
		List<CcenterDTO> listOneOnOne = adminDAO.listOneOnOne(cri);
		return listOneOnOne;
	}
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//--------------------------------------------------------------------------------------------------
	@Override
	public void deleteArticle(int articleNo) throws Exception {
		adminDAO.deleteArticle(articleNo);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 전체 조회
	//--------------------------------------------------------------------------------------------------
	
	@Override
	public List<ReportDTO> listReportAnswer(ReportCriteria rcri) throws Exception {
		System.out.println("################################# Service listReportAnwer => " + rcri);
		
		return adminDAO.listReportAnswer(rcri);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 페이징(게시글수 구하기: rcri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	@Override
	public int reportAnswerTotalCount(ReportCriteria rcri) throws Exception {
		System.out.println("################################# Service reportAnswerTotalCount => " + rcri);
		return adminDAO.reportAnswerTotalCount(rcri);
	}
	

	//--------------------------------------------------------------------------------------------------
	// 회원목록 페이징(게시글수 구하기: cri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	@Override
	public int memberListTotalCount(Criteria cri) throws Exception {
		return adminDAO.memberListTotalCount(cri);
		
	}
}
