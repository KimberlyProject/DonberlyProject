package com.ezen.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.Criteria;
import com.ezen.admin.dto.ReportCriteria;
import com.ezen.admin.dto.SearchCriteria;
import com.ezen.member.dto.MemberDTO;


public interface AdminService {
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 조회 + 페이징 + 검색
	//--------------------------------------------------------------------------------------------------
	public List<MemberDTO> memberList(Criteria cri) throws Exception;

	//--------------------------------------------------------------------------------------------------
	// 회원 상세 정보
	//--------------------------------------------------------------------------------------------------
	public MemberDTO memberDetail(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 정보 수정 POST
	//--------------------------------------------------------------------------------------------------
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 삭제 POST
	//--------------------------------------------------------------------------------------------------
	public void memberDelete(String memberDTO) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 7일 정지
	//--------------------------------------------------------------------------------------------------
	public void Asuspension(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 영구 정지
	//--------------------------------------------------------------------------------------------------
	public void Psuspension(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 전체 조회 + 검색
	//--------------------------------------------------------------------------------------------------
	public List<CcenterDTO> listOneOnOne(SearchCriteria cri) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 페이징(게시글수 구하기: rcri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	public int reportAnswerTotalCount(ReportCriteria rcri) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//--------------------------------------------------------------------------------------------------
	public void deleteArticle(int articleNo) throws Exception;
		
	//--------------------------------------------------------------------------------------------------
	// 신고하기 전체 조회
	//--------------------------------------------------------------------------------------------------
	public List<ReportDTO> listReportAnswer(ReportCriteria rcri) throws Exception;	
	
	//--------------------------------------------------------------------------------------------------
	// 회원목록 페이징(게시글수 구하기: cri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	public int memberListTotalCount(Criteria cri) throws Exception;
}
