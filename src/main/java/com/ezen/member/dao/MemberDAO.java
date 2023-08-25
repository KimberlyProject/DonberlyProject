package com.ezen.member.dao;

import com.ezen.member.dto.MemberDTO;

public interface MemberDAO {


	//경은
	public MemberDTO logOn(MemberDTO memberDTO) throws Exception;
}
