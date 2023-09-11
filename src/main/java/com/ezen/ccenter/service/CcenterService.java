package com.ezen.ccenter.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ccenter.dao.CcenterDAO;

@Service("ccenterService")
public class CcenterService{

	// 1대1 문의 서비스
	@Autowired
	CcenterDAO ccenterDAO;
	
	
	public int addNewAsk(Map articleMap) throws Exception {
		
	System.out.println("1대1문의 Service");
		
		return ccenterDAO.addNewAsk(articleMap);
	}
	
	public int addNewReport(Map articleMap) throws Exception {
		
	System.out.println("신고하기 Service");
		
		return ccenterDAO.addNewReport(articleMap);
	}
	
	
}
