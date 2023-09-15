package com.ezen.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.ccenter.dto.CcenterDTO;
import com.ezen.ccenter.dto.ReportDTO;
import com.ezen.admin.dto.Criteria;
import com.ezen.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezen.admin.mapper.adminMapper";
	
	//--------------------------------------------------------------------------------------------------
	// 회원 전체 목록
	//--------------------------------------------------------------------------------------------------	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		
		return sqlSession.selectList(namespace + ".selectMember");
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
	// cri를 가지고 검색한 총 건수의 전체 게시글 수 구하기(paging 처리)
	//--------------------------------------------------------------------------------------------------
	@Override
	public int memberListTotalCount(Criteria cri) throws Exception {
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ cri ==> " + cri);
		return sqlSession.selectOne(namespace + ".memberListTotalCount", cri);
	}

	//--------------------------------------------------------------------------------------------------
	// 게시글 목록 가져오기(paging)
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<MemberDTO> memberListPaging(Criteria cri) throws Exception {
		System.out.println("###################### cri ==> " + cri);
		return sqlSession.selectList(namespace + ".memberListPaging", cri);
	}
	
	//--------------------------------------------------------------------------------------------------
	// 1:1 문의 내역 리스트 생성
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<CcenterDTO> listOneOnOne() throws Exception {
		List<CcenterDTO> listOneOnOne = sqlSession.selectList(namespace + ".listOneOnOne");
		
		System.out.println("1:1문의 정보: " + listOneOnOne);
		return listOneOnOne;
	}

	//--------------------------------------------------------------------------------------------------
	// 1:1 문의하기 리스트 삭제
	//--------------------------------------------------------------------------------------------------
	@Override
	public void deleteArticle(int articleNo) throws Exception {
		sqlSession.delete(namespace + ".deleteArticle", articleNo);
	}
	
	
	//--------------------------------------------------------------------------------------------------
	// 신고하기 내역 리스트 생성 (원본)
	//--------------------------------------------------------------------------------------------------
	@Override
	public List<ReportDTO> listReportAnswer() throws Exception {
		List<ReportDTO> listReportAnswer = sqlSession.selectList(namespace + ".listReportAnswer");
		
		System.out.println("신고하기 정보: " + listReportAnswer);
		return listReportAnswer;
	}
	
	
}
