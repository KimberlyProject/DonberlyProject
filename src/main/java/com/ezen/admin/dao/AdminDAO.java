package com.ezen.admin.dao;

import java.util.List;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.member.dto.MemberDTO;

public interface AdminDAO {
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception; : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------
	public List<MemberDTO> selectMember() throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public MemberDTO memberDetail(String id) throws Exception; : 회원 상세 목록
	//--------------------------------------------------------------------------------------------------
	public MemberDTO memberDetail(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public void memberUpdate(MemberDTO memberDTO) throws Exception; : 회원 상세 목록
	//--------------------------------------------------------------------------------------------------
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public void memberUpdate(MemberDTO memberDTO) throws Exception; : 회원 삭제
	//--------------------------------------------------------------------------------------------------
	public void memberDelete(String memberDTO) throws Exception;
	
	
	public List<CcenterDTO> listOneOnOne() throws Exception;
}
