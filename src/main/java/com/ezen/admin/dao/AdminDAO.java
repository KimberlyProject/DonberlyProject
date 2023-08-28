package com.ezen.admin.dao;

import java.util.List;

import com.ezen.member.dto.MemberDTO;

public interface AdminDAO {
	public List<MemberDTO> selectMember() throws Exception;
}
