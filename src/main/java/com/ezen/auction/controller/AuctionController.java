package com.ezen.auction.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.auction.dto.AuctionDTO;
import com.ezen.auction.service.AuctionService;
import com.ezen.member.dto.memberDTO;

@Controller
@RequestMapping("auction")
public class AuctionController {

	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	private static final String AUC_IMG_REPO = "C:/data/workspace/src/main/webapp/resources/data";
	@Inject
	private AuctionService aucService;
	@Inject
	private AuctionDTO aucDAO;
	

	//글 업로드 메서드
	@RequestMapping(value="/auction_sale_articleWirte", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewAucArticle(MultipartHttpServletRequest req, HttpServletResponse res)
	throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		Enumeration enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = req.getPa rameter(name);
			articleMap.put(name,  value);
		}
		
		String imageFileName = upload(req);
		HttpSession session = req.getSession();
		memberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getUserId();
		
		articleMap.put("parentNO, 0);"
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		return null;
	}
	
	public String upload() {
		return null;
	}
	
}//class
