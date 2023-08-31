package com.ezen.auction.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.auction.dto.AucImgDTO;
import com.ezen.auction.dto.AuctionDTO;
import com.ezen.auction.service.AuctionService;
import com.ezen.member.dto.MemberDTO;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	private static final String IMGROOT = "C:\\data\\workspace\\imgfiles";
	@Inject
	private AuctionService auctionService;

	//글쓰기화면
	@RequestMapping(value="/auction_write", method=RequestMethod.GET)
	public String auctionWrite(Model model) {
		System.out.println("경매 글쓰기 화면");
		return "/auction/auction_write";
	}

	//게시글 업로드
	@RequestMapping(value="/addNewArticle", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest req, HttpServletResponse res) throws Exception {
		
		System.out.println("게시글 업로드 컨트롤러 시작");
		req.setCharacterEncoding("UTF-8");
		String  imgName = null;
		
		Map articleMap = new HashMap();
		Enumeration enu = req.getParameterNames();
	    System.out.println("enu : " + enu);
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = req.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			articleMap.put(name, value);
		}
		
		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String aucId = memberDTO.getUserId();
		articleMap.put("aucId", aucId);
		System.out.println("세션이랑 멤버디티오 실행" + aucId);
		
		
		List<String> fileList = upload(req);
		System.out.println("upload 메서드 실행중" + fileList);
		List<AucImgDTO> imgFileList = new ArrayList<AucImgDTO>();
		System.out.println("이미지 List<AucImgDTO> 가져오기" + imgFileList);
		if(fileList != null && fileList.size() != 0 ) {
			for(String fileName : fileList) {
				AucImgDTO aucImgDTO = new AucImgDTO();
				aucImgDTO.setImgName(fileName);
				imgFileList.add(aucImgDTO);
			}
		} else if(fileList == null) {
			AucImgDTO aucImgDTO = new AucImgDTO();
			aucImgDTO.setImgName("이미지가 첨부되지 않았습니다.");
			imgFileList.add(aucImgDTO);
		}
		articleMap.put("imgFileList", imgFileList);
		System.out.println("이미지 파일 가져오기 articleMap" + imgFileList);
		
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders resHds = new HttpHeaders();
		resHds.add("content-Type", "text/html; charset=utf-8");
		
		try {
			int aucCode = auctionService.addNewArticle(articleMap);
			if(imgFileList != null && imgFileList.size() != 0) {
				for(AucImgDTO aucImgDTO : imgFileList) {
					imgName = aucImgDTO.getImgName();
					System.out.println("다중이미지" + imgName);
					
					File srcFile = new File(IMGROOT + "\\" + "temp" + "\\" + imgName);
					File destFile = new File(IMGROOT + "\\" + aucCode);
					FileUtils.moveFileToDirectory(srcFile,  destFile, true);
				}
			}
			msg = "<script>";
			msg += "alert('새 글을 추가했습니다.');";
			msg += "location.href='" + req.getContextPath()+"/auction/auction_main';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, resHds, HttpStatus.CREATED);
		} catch(Exception e) {
			if(imgFileList != null && imgFileList.size() != 0) {
				for(AucImgDTO aucImgDTO : imgFileList) {
					imgName = aucImgDTO.getImgName();
					File srcFile = new File(IMGROOT + "\\" + "temp" + "\\" + imgName);
					srcFile.delete();
				}
			}
			msg = "<script>";
			msg += "alert('오류가 발생했습니다. 다시 시도해주세요');');)";
			msg += "location.href='" + req.getContextPath()+ "/auction/auction_write';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, resHds, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}		//이미지 업로드 메서드
			private List<String> upload(MultipartHttpServletRequest req) throws Exception {
				List<String> fileList = new ArrayList<String>();
				Iterator<String> fileNames = req.getFileNames();
				while(fileNames.hasNext()) {
					String fileName = fileNames.next();
					MultipartFile mFile = req.getFile(fileName);
					String originalFileName = mFile.getOriginalFilename();
					System.out.println("이미지 이름 잘 들어왔낭???" + originalFileName);
					fileList.add(originalFileName);
					File file = new File(IMGROOT + "\\" + "temp" + "\\" + fileName);
					if(mFile.getSize() != 0) {
						if(!file.exists()) { //경로에 파일이 없는 경우
							file.getParentFile().mkdirs(); //경로에 해당하는 디렉토리 생성
							mFile.transferTo(new File(IMGROOT + "\\" + "temp" + "\\" + originalFileName));
						}
					}
				}
				return fileList;
			}
	
	
		
	//메인페이지 불러오기
	@RequestMapping(value="/auction_main", method=RequestMethod.GET)
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("경매장 메인 리스트불러오기 컨트롤러");
		String viewName = (String) request.getAttribute("viewName");
		List<AuctionDTO> articlesList	= auctionService.listArticles();
		List<AucImgDTO> articlesList2 = auctionService.listArticlesImg();

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);	
		mav.addObject("articlesList2", articlesList2);
		return mav;
	}			

	//디테일페이지 불러오기
	@RequestMapping(value="/auction_detail", method=RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("aucCode") int aucCode, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		AuctionDTO auctionDTO = auctionService.viewArticle(aucCode);
		AucImgDTO aucImgDTO = auctionService.viewArticleImg(aucCode);
		System.out.println("디테일페이지 컨트롤러" + aucCode);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articlesList", auctionDTO);
		mav.addObject("aritlcesList", aucImgDTO);
		
		return mav;
	}	
	
	@RequestMapping(value="/auction_modiandupdate", method=RequestMethod.GET)
	public ModelAndView modifyAndUpdate (
		@RequestParam(value="aucCode") int aucCode,
		@RequestParam(value="nowBid", required=false) int nowBid,
		@RequestParam(value="maxPrice", required=false) int maxPrice) throws Exception {
		return null;
	}
	
	//경매취소 삭제하기
	@RequestMapping(value="/auctionOff", method=RequestMethod.GET)
	public String removeAuction(@RequestParam("aucCode") int aucCode, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
			System.out.println("경매종료 삭제하는 컨트롤러 " + aucCode);
			
		res.setContentType("text/html;charset=UTF-8");
		String message;
		ResponseEntity	resEnt			= null;
		HttpHeaders		responseHeaders	= new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		
		try {
			
			auctionService.removeAuction(aucCode);
			
			File destDir = new File(IMGROOT + "\\" + aucCode);
			FileUtils.deleteDirectory(destDir);
		
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + req.getContextPath()+"/auction/auction_main';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+ req.getContextPath()+"/auction/auction_detail?auction=${articlesList.aucCode}';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return "auction/auction_main";
	}
	

}//class
