package com.ezen.admin.dao;

import java.util.List;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
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
	// 신고하기 리스트 생성
	//--------------------------------------------------------------------------------------------------
	public List<ReportDTO> listReportAnswer() throws Exception;
}
