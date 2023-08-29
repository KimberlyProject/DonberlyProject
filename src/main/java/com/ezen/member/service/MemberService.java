package com.ezen.member.service;

import java.util.List;

import com.ezen.member.dto.MemberDTO;

public interface MemberService {

	//경은
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	
	// 회원 아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 회원 가입 POST
	public int membership(MemberDTO memberDTO) throws Exception;

	// 닉네임 중복 검사
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	


}
