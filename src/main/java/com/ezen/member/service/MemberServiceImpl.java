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
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
	
		return memberDAO.login(memberDTO);
	}
	
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl 아이디 중복 검사()");
		int result = memberDAO.idCheck(memberDTO);
		return result;
	}
	
	@Override
	public String findId(MemberDTO memberDTO) throws Exception {		
		return memberDAO.findId(memberDTO);
	}
	
	public MemberDTO profileModal(MemberDTO memberDTO) throws Exception {
		return memberDAO.profileModal(memberDTO);
	}
	
	@Override
	public String findPasswd(MemberDTO memberDTO) throws Exception {		
		return memberDAO.findPasswd(memberDTO);
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

	// 11:52
	@Override
    public MemberDTO userProfileEditor(String id) throws Exception {
        return memberDAO.userProfileEditor(id);
    }

    @Override
    public void memberUpdate(MemberDTO memberDTO) throws Exception {
        memberDAO.memberUpdate(memberDTO);
    }

    // 09-04
	/*
	 * @Override public MemberDTO getProfileData(MemberDTO memberDTO) { // 데이터베이스에서
	 * MemberDTO를 조회하고 반환합니다. return memberDAO.getProfileData(memberDTO); }
	 */

	@Override
	public void memberDelete(MemberDTO memberDTO) throws Exception {
		memberDAO.memberDelete(memberDTO);
	}
    
}
