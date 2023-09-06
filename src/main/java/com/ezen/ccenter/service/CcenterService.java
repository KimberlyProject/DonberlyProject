package com.ezen.ccenter.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ccenter.dao.CcenterDAO;

@Service("ccenterService")
public class CcenterService{

	@Autowired
	CcenterDAO ccenterDAO;
	
	
	public int addNewAsk(Map articleMap) throws Exception {
		
	System.out.println("1대1문의 Service");
		
		return ccenterDAO.addNewAsk(articleMap);
	}
}
