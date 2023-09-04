package com.ezen.member.service;

import java.util.List;

import com.ezen.member.dto.MemberDTO;

public interface MemberService {

	//경은
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	// 아이디 찾기
	public String findId(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 찾기
	public String findPasswd(MemberDTO memberDTO) throws Exception;	
	
	// 회원 아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 회원 가입 POST
	public int membership(MemberDTO memberDTO) throws Exception;

	// 닉네임 중복 검사
	public int nickCheck(MemberDTO memberDTO) throws Exception;

	// 11:52
	public MemberDTO userProfileEditor(String id) throws Exception;

	public void memberUpdate(MemberDTO memberDTO) throws Exception;

	// 09-04
	public MemberDTO memberProfile(String userId) throws Exception;
	
	//회원탈토;
	public void memberDelete(MemberDTO memberDTO) throws Exception;
	


}
