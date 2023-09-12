package com.ezen.member.dao;

import com.ezen.member.dto.MemberDTO;

public interface MemberDAO {


	//경은
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	// 회원 등급 조회
	public MemberDTO memberLevel(String userId) throws Exception;

	// 아이디 중복 확인
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 아이디 찾기
	public String findId(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO profileModal(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 찾기
	public String findPasswd(MemberDTO memberDTO) throws Exception;

	// 회원가입 POST
	public int membership(MemberDTO memberDTO) throws Exception;

	// 닉네임 중복 확인
	public int nickCheck(MemberDTO memberDTO) throws Exception;

	public MemberDTO userProfileEditor(String id) throws Exception;

	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
//	public MemberDTO getProfileData(MemberDTO memberDTO);
	
	public void memberDelete(MemberDTO memberDTO) throws Exception;
}
