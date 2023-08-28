package com.ezen.member.dao;

import com.ezen.member.dto.MemberDTO;

public interface MemberDAO {


	//경은
	public MemberDTO logOn(MemberDTO memberDTO) throws Exception;

	// 아이디 중복 확인
	public int idCheck(MemberDTO memberDTO) throws Exception;

	// 회원가입 POST
	public int membership(MemberDTO memberDTO) throws Exception;
}
