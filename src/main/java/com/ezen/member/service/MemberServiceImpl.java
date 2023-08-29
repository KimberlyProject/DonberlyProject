package com.ezen.member.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.member.dao.MemberDAO;
import com.ezen.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	private MemberDAO memberDAO;
	//경은
	@Override
	public MemberDTO logOn(MemberDTO memberDTO) throws Exception {
	
		return memberDAO.logOn(memberDTO);
	}
	
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl 아이디 중복 검사()");
		int result = memberDAO.idCheck(memberDTO);
		return result;
	}

	@Override
	public int membership(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl 회원가입() POST");
		int result = memberDAO.membership(memberDTO);
		return result;
	}

	@Override
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl 아이디 중복 검사()");
		int result = memberDAO.nickCheck(memberDTO);
		return result;
	}


}
