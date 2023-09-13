package com.ezen.mypage.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.mypage.dao.MypageDAO;
import com.ezen.mypage.dto.CalendarDTO;

@Service("mypageService")
public class MypageService {
	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);
	
	@Autowired
	private MypageDAO mypageDAO;
	
	public List<CalendarDTO> calendarList(String userId) throws Exception{
		logger.info("Calendar 리스트가져오기 Service");
		return mypageDAO.calendarList(userId);
	}

}
