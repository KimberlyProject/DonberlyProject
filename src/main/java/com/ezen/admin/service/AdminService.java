package com.ezen.admin.service;

import java.util.List;

import com.ezen.member.dto.MemberDTO;

public interface AdminService {
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception; : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------
	public List<MemberDTO> selectMember() throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public MemberDTO memberDetail(String userId) throws Exception; : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------
	public MemberDTO memberDetail(String userId) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception; : 회원 정보 수정 POST
	//--------------------------------------------------------------------------------------------------
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//--------------------------------------------------------------------------------------------------
	// public void memberDelete(MemberDTO memberDTO) throws Exception; : 회원 삭제 POST
	//--------------------------------------------------------------------------------------------------
	public void memberDelete(String memberDTO) throws Exception;
}