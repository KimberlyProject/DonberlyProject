package com.ezen.admin.service;

import java.util.List;

import com.ezen.member.dto.MemberDTO;

public interface AdminService {
	public List<MemberDTO> selectMember() throws Exception;
}
