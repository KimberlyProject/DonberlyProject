package com.ezen.auction.controller;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
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
import com.ezen.auction.dto.PageMaker;
import com.ezen.auction.dto.SearchCriteria;
import com.ezen.auction.service.AuctionService;
import com.ezen.member.dto.MemberDTO;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	//컴퓨터 경로
	//private static final String IMGROOT = "C:\\data\\workspace\\imgfiles";
	//프로젝트 경로 (임시경로temp생성후 실제저장경로 새성까지 됨, refresh 필수)
	private static final String IMGROOT = "C:\\data\\workspace\\DonberlyProject\\src\\main\\webapp\\resources\\images\\auction\\auction_image";
	@Inject
	private AuctionService auctionService;

	
	//-------------------------------------------------------------------------------------------------------------//
	//경매장 이용방법
	@RequestMapping(value="/howToUse", method=RequestMethod.GET)
	public String howToUseAuction(Model model) {
		return "/auction/howToUse";
	}
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//메인페이지 게시글 리스트 전부 불러오기
	@RequestMapping(value="/auction_main", method=RequestMethod.GET)
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri) throws Exception {
		System.out.println("경매장 메인 리스트불러오기 컨트롤러");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(auctionService.auctionTotalCount(cri));	
		
		List<AuctionDTO> articles	= auctionService.listArticles();; //게시글 여러개 forEach문으로 출력
		List<AucImgDTO> imgs = auctionService.listArticlesImg(); //이미지 여러개 forEach문으로 출력
		
		mav.addObject("articles", articles);	
		mav.addObject("imgs", imgs);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("cri", cri);
		return mav;
	}	
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//aucCode에 해당하는 디테일페이지 불러오기
	@RequestMapping(value="/auction_detail", method=RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("aucCode") int aucCode, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		System.out.println("------------------------------------------디테일페이지 컨트롤러" + aucCode + "------------------------------------------");
		AuctionDTO auctionDTO = auctionService.viewArticle(aucCode); //게시글 한개 출력
		List<AucImgDTO> aucImgDTO = auctionService.viewArticleImg(aucCode); //이미지 여러개 forEach문으로 출력
		System.out.println(auctionDTO);
		System.out.println(aucImgDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", auctionDTO);
		mav.addObject("imgs", aucImgDTO);
		
		return mav;
	}// viewArticle
	
	//-------------------------------------------------------------------------------------------------------------//

	//저장된 이미지 모두 가져오기 컨트롤러
	@RequestMapping("/pullAuctionImges")
	protected void pullImgFiles(@RequestParam("imgName") String imgName, @RequestParam("aucCode") int aucCode,
			HttpServletResponse response)	throws Exception {
								
		OutputStream out = response.getOutputStream();
		String downFile	 = IMGROOT + "\\" + aucCode + "\\" + imgName;
		File file = new File(downFile);
	
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + imgName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();	
	}//pullImgFiles
	
	//-------------------------------------------------------------------------------------------------------------//
	
	//글쓰기화면
	@RequestMapping(value="/auction_write", method=RequestMethod.GET)
	public String auctionWrite(Model model) {
		System.out.println("경매 글쓰기 화면");
		return "/auction/auction_write";
	}//auctionWrite

	//게시글 업로드
	@RequestMapping(value="/addNewArticle", method = RequestMethod.POST)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		System.out.println("게시글 업로드 컨트롤러 시작");
		req.setCharacterEncoding("UTF-8");
		
		//minPrice, maxPrice (,)빼고 int로 형변환
		String min = req.getParameter("minPrice");
		String sanitizedValueMin = min.replace(",", "");
		int minPrice = Integer.parseInt(sanitizedValueMin);
		
		String max = req.getParameter("maxPrice");
		String sanitizedValueMax = max.replace(",", "");
		int maxPrice = Integer.parseInt(sanitizedValueMax);
		
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
		String aucId = memberDTO.getUserId(); //여기 오류는 로그인이 안된것!
		String aucNick = memberDTO.getNickname();
		articleMap.put("aucId", aucId);
		articleMap.put("aucNick", aucNick);
		articleMap.put("minPrice", minPrice);
		articleMap.put("maxPrice", maxPrice);
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
	}//addNewArticle	
	
	//이미지 업로드 메서드
	private List<String> upload(MultipartHttpServletRequest req) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = req.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = req.getFile(fileName);
			String imgName = mFile.getOriginalFilename();
			System.out.println("이미지 이름 잘 들어왔낭???" + imgName);
			fileList.add(imgName);
			File file = new File(IMGROOT + "\\" + "temp" + "\\" + imgName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) { //경로에 파일이 없는 경우
					file.getParentFile().mkdirs(); //경로에 해당하는 디렉토리 생성
					mFile.transferTo(new File(IMGROOT + "\\" + "temp" + "\\" + imgName));
					
					String targetPath = IMGROOT + "\\" + "temp" + "\\" + imgName;
		            resizeImage(file.getAbsolutePath(), targetPath, 200, 200); // 원하는 크기로 조절
				}
			}
		}
		return fileList;
	}//upload	

	//이미지 리사이징 메서드
	private void resizeImage(String sourcePath, String targetPath, int targetWidth, int targetHeight) throws IOException {
	    BufferedImage originalImage = ImageIO.read(new File(sourcePath));
	    int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

	    BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, type);
	    Graphics2D g = resizedImage.createGraphics();
	    g.drawImage(originalImage, 0, 0, targetWidth, targetHeight, null);
	    g.dispose();

	    ImageIO.write(resizedImage, "jpg", new File(targetPath));
	}

	//-------------------------------------------------------------------------------------------------------------//
	
	//판매자 경매취소 삭제하기
	@RequestMapping(value="/auctionOff", method=RequestMethod.GET)
	public String removeAuction(@RequestParam("aucCode") int aucCode, 
			HttpServletRequest req, HttpServletResponse res)
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
	}//removeAuction

	//판매자 현재입찰가로 판매하기
	@RequestMapping(value="/saleNow", method=RequestMethod.GET)
	public String saleNow(@RequestParam("aucCode") int aucCode,
								  @RequestParam("cstmId") String cstmId,
			HttpServletRequest Request, HttpServletResponse response)
			throws Exception {

		System.out.println("판매자 현재입찰가로 판매하기 Controller");
		Request.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = Request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= Request.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String 	aucCode1	= (String)articleMap.get("aucCode");
		String	message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		auctionService.saleNow(articleMap);
		
		return "auction/auction_main";
	}//saleNow
	
	//구매자 입찰하기
	@RequestMapping(value="/tryBid", method=RequestMethod.GET)
	public String tryBid(@RequestParam("aucCode") int aucCode,
						 @RequestParam("cstmId") String cstmId,
						 @RequestParam("nowBid") int nowBid,
			HttpServletRequest Request, HttpServletResponse response)
			throws Exception {

		System.out.println("구매자 입찰하기 Controller");
		Request.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = Request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= Request.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String 	aucCode1 = (String)articleMap.get("aucCode");
		String	message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		auctionService.tryBid(articleMap);
		
		return "auction/auction_main";
	}//tryBid
	
	//구매자 상한가 구매하기
	@RequestMapping(value="/buyNow", method=RequestMethod.GET)
	public String buyNow(@RequestParam("aucCode") int aucCode,
						 @RequestParam("cstmId") String cstmId,
						 @RequestParam("maxPrice") int maxPrice,
			HttpServletRequest Request, HttpServletResponse response)
			throws Exception {

		System.out.println("상한가 구매 Controller");
		Request.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = Request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= Request.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String 	aucCode1	= (String)articleMap.get("aucCode");
		String	message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		auctionService.buyNow(articleMap);
		
		return "auction/auction_main";
	}//buyNow		
	
}
