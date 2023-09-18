package com.ezen.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.Criteria;
import com.ezen.admin.dto.ReportCriteria;
import com.ezen.admin.dto.SearchCriteria;
import com.ezen.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezen.admin.mapper.adminMapper";
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 조회 + 페이징 + 검색
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<MemberDTO> memberList(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".memberList", cri);
	}

	//--------------------------------------------------------------------------------------------------
	// 회원아이디에 해당하는 상세 정보 조회
	//--------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO memberDetail(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", userId);
	}

	//--------------------------------------------------------------------------------------------------
	// 회원정보 수정 POST
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		logger.info("회원정보수정 DAO ==> " + memberDTO);
		sqlSession.update(namespace + ".update", memberDTO);
		
	}

	//--------------------------------------------------------------------------------------------------
	// 회원정보 삭제 POST
	//--------------------------------------------------------------------------------------------------
	@Override
	public void memberDelete(String memberDTO) throws Exception {
		
		logger.info("회원정보삭제 DAO ==> " + memberDTO);
		sqlSession.delete(namespace + ".delete", memberDTO);
		
	}

	//--------------------------------------------------------------------------------------------------
	// 회원 7일 정지
	//--------------------------------------------------------------------------------------------------
	@Override
	public void Asuspension(String userId) throws Exception {
		logger.info("회원 3일 정지 DAO ==> " + userId);
		sqlSession.insert(namespace + ".Asuspension", userId);
		
	}

	//--------------------------------------------------------------------------------------------------
	// 회원 영구 정지
	//--------------------------------------------------------------------------------------------------
	@Override
	public void Psuspension(String userId) throws Exception {
		logger.info("회원 3일 정지 DAO ==> " + userId);
		sqlSession.insert(namespace + ".Psuspension", userId);
		
	}

	//--------------------------------------------------------------------------------------------------
	// 회원목록 페이징(게시글수 구하기: cri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	@Override
	public int memberListTotalCount(Criteria cri) throws Exception {
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ cri ==> " + cri);
		return sqlSession.selectOne(namespace + ".memberListTotalCount", cri);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 전체 조회 + 검색
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<CcenterDTO> listOneOnOne(SearchCriteria cri) throws Exception {
		List<CcenterDTO> listOneOnOne = sqlSession.selectList(namespace + ".listOneOnOne", cri);
		
		System.out.println("1:1문의 정보: " + listOneOnOne);
		return listOneOnOne;
	}
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 전체 내역 조회
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<ReportDTO> listReportAnswer(ReportCriteria rcri) throws Exception {
		System.out.println("################################# DAO listReportAnswer => " + rcri);
		List<ReportDTO> listReportAnswer = sqlSession.selectList(namespace + ".listReportAnswer", rcri);
		System.out.println("신고하기 정보: " + listReportAnswer);
		return listReportAnswer;
	}
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 페이징(게시글수 구하기: rcri를 가지고 검색한 총 게시글의 수)
	//--------------------------------------------------------------------------------------------------
	@Override
	public int reportAnswerTotalCount(ReportCriteria rcri) throws Exception {
		System.out.println("################################# DAO reportAnswerTotalCount => " + rcri);
		return sqlSession.selectOne(namespace + ".reportAnswerTotalCount", rcri);
	}

}
