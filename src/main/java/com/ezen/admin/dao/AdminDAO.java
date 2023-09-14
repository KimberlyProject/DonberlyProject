package com.ezen.admin.dao;

import java.util.List;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.Criteria;
import com.ezen.member.dto.MemberDTO;

public interface AdminDAO {
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 목록
	//--------------------------------------------------------------------------------------------------
	public List<MemberDTO> selectMember() throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 상세 목록
	//--------------------------------------------------------------------------------------------------
	public MemberDTO memberDetail(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 상세 목록
	//--------------------------------------------------------------------------------------------------
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 회원 삭제
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
	// 1:1 문의하기 리스트 생성
	//--------------------------------------------------------------------------------------------------
	public List<CcenterDTO> listOneOnOne() throws Exception;
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//--------------------------------------------------------------------------------------------------
	public void deleteArticle(int articleNo) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 리스트 생성
	//--------------------------------------------------------------------------------------------------
	public List<ReportDTO> listReportAnswer() throws Exception;
	// cri를 가지고 검색한 총 건수의 전체 게시글 수 구하기(paging 처리)
	//--------------------------------------------------------------------------------------------------
	public int memberListTotalCount(Criteria cri) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기(paging)
	//--------------------------------------------------------------------------------------------------
	public List<MemberDTO> memberListPaging(Criteria cri) throws Exception;

}
