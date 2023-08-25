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


}
