package com.ezen.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezen.admin.dao.AdminDAO;
import com.ezen.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	//--------------------------------------------------------------------------------------------------
	// public List<MemberDTO> selectMember() throws Exception; : 회원 전체 목록
	//--------------------------------------------------------------------------------------------------
	
	@Inject
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return adminDAO.selectMember();
	}

}
