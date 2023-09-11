package com.ezen.board.controller;

import java.io.File;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.board.dto.ArticleVO;
import com.ezen.board.dto.Criteria;
import com.ezen.board.dto.PageMaker;
import com.ezen.board.dto.SaleArticleVO;
import com.ezen.board.dto.SearchCriteria;
import com.ezen.board.service.BoardService;
import com.ezen.member.dto.MemberDTO;



//-----------------------------------------------------------------------------------------------------------
// 게시글
//-----------------------------------------------------------------------------------------------------------
@Controller("boardController")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//-----------------------------------------------------------------------------------------------------------
	// 계층형 쿼리
	//-----------------------------------------------------------------------------------------------------------
	/*
	 * SELECT	LEVEL, articleNO, parentNO, title, content, writeDate, imageFileName, id
	 * FROM		t_board
	 * START WITH parentNO = 0	-- 어떤 레코드를 최상위 레코드로 정할 지 결정
	 * CONNECT BY PRIOR articleNO = parentNO	-- 연결고리를 만든다. PRIOR 연산자로 계층구조를 표현할 수 있다.
	 * ORDER SIBLINGS BY articleNO DESC;
	 * 
	 * 계층형 쿼리 : 부모, 자식 간의 수직관계를 트리 구조 형태로 보여주는 쿼리.
	 * START WIDTH : 트리 구조의 최상위 행을 지정한다.
	 * CONNECT BY  : 부모, 자식의 관계를 지정한다.
	 * PRIOR	   : CONNECT 절에 사용되며 PRIOR에 지정된 컬럼이 맞은편 컬럼을 찾아간다.
	 * CONNECT BY PRIOR 자식컬럼 = 부모컬럼 : 부모 -> 자식의 순방향 전개
	 * CONNECT BY PRIOR 부모컬럼 = 자식컬럼 : 자식 -> 부모의 역방향 전개
	 * ORDER SIBLINGS : 계층형 쿼리에서 정렬을 수행한다.
	 */
	

	//-----------------------------------------------------------------------------------------------------------
	// 업로드된 폴더와 위치가 같아야 한다.
	//-----------------------------------------------------------------------------------------------------------
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\workspace\\DonberlyProject\\src\\main\\webapp\\resources\\images\\board\\article_image";
	
	//-----------------------------------------------------------------------------------------------------------
	// Spring에서 지원하는 어노테이션
	// @Autowired는 주입하려고 하는 객체의 타입이 일치하는지를 찾고 객체를 자동으로 주입한다.
	// @Autowired 찾는 순서 : 타입 => 이름 => @Qualifier => 실패
	// @Inject    찾는 순서 : 타입 => @Qualifier => 이름 => 실패
	//-----------------------------------------------------------------------------------------------------------
	@Autowired	
	private BoardService boardService;
	@Inject		// Java에서 지원하는 어노테이션
	private ArticleVO articleVO;
	@Inject		// Java에서 지원하는 어노테이션
	private SaleArticleVO saleArticleVO;

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 쓰기 화면
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/buy/articleForm.do", method=RequestMethod.GET)
	public ModelAndView articleForm() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buy/articleForm");

		return mav;
	} // End - 게시글 쓰기 화면
	
	
	@RequestMapping(value="/sale/articleForm.do", method=RequestMethod.GET)
	public ModelAndView saleArticleForm() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sale/articleForm");

		return mav;
	} // End - 게시글 쓰기 화면

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 쓰기 처리
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/buy/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		// pom.xml에 업로드관련 라이브러리를 추가한다.
		// 먼저 servlet-xml에 파일 업로드 관련 설정을 해야 한다.
		// 파일업로드에 대한 규칙(multipartResolver)을 적용한다. 

		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String	name	= (String)enu.nextElement();
			String	value	= multipartRequest.getParameter(name);

			System.out.println("name : "  + name);
			System.out.println("value : " + value);
			articleMap.put(name, value);
			
		}
		
		String thumbnail = upload(multipartRequest);
		
		HttpSession session	= multipartRequest.getSession();
		MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		String	userId = memberDTO.getUserId();
		
		logger.info("2222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
		logger.info("userId : " + userId);
		
		articleMap.put("userId", 	userId);
		articleMap.put("thumbnail", thumbnail);
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		try {
			int articleNO = boardService.buyAddNewArticle(articleMap);
			if(thumbnail != null && thumbnail.length() != 0) {
				File srcDir  = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveToDirectory(srcDir, destDir, true);
			}
			
			message	 = "<script>";
			message	+= "alert('새로운 글을 추가하였습니다.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/buy/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
			srcFile.delete();
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/buy/articleForm.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
		
	} // End - 게시글 쓰기 처리
	
	
	
	@RequestMapping(value="/sale/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity saleAddNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		// pom.xml에 업로드관련 라이브러리를 추가한다.
		// 먼저 servlet-xml에 파일 업로드 관련 설정을 해야 한다.
		// 파일업로드에 대한 규칙(multipartResolver)을 적용한다. 

		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String	name	= (String)enu.nextElement();
			String	value	= multipartRequest.getParameter(name);

			System.out.println("name : "  + name);
			System.out.println("value : " + value);
			articleMap.put(name, value);
			
		}
		
		String thumbnail = upload(multipartRequest);
		
		HttpSession session	= multipartRequest.getSession();
		MemberDTO memberDTO	= (MemberDTO) session.getAttribute("member");
		String	userId = memberDTO.getUserId();
		
		logger.info("2222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
		logger.info("userId : " + userId);
		
		articleMap.put("userId", 	userId);
		articleMap.put("thumbnail", thumbnail);
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		try {
			int articleNO = boardService.saleAddNewArticle(articleMap);
			if(thumbnail != null && thumbnail.length() != 0) {
				File srcDir  = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail );
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\"  + articleNO);
				FileUtils.moveToDirectory(srcDir, destDir, true);
			}
			
			message	 = "<script>";
			message	+= "alert('새로운 글을 추가하였습니다.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/sale/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
			srcFile.delete();
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/sale/articleForm.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
		
	} // End - 게시글 쓰기 처리
	
	//-----------------------------------------------------------------------------------------------------------
	// 이미지 업로드하기
	//-----------------------------------------------------------------------------------------------------------
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		String thumbnail = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile	= multipartRequest.getFile(fileName);
			thumbnail = mFile.getOriginalFilename();
			
			System.out.println("------------------------------------------------------------");
			System.out.println("fileName ==> " + fileName);
			System.out.println("thumbnail ==> " + thumbnail);

			// File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
			if(mFile.getSize() != 0) {
				if(!file.exists()) { // 파일을 올릴 경로에 파일이 존재하지 않는다면
					file.getParentFile().mkdirs();	// 경로에 해당하는 디렉토리를 생성한다.
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail));
				}
			}
		}
		
		return thumbnail;
		
	} // End - private String upload(MultipartHttpServletRequest multiparRequest) throws Exception

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 상세 정보
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/buy/viewArticle.do", method=RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		// 게시글 번호에 해당하는 정보를 모두 가져온다.
		articleVO = boardService.buyViewArticle(articleNO);
		
		System.out.println("--------BoardControllerImpl viewArticle() : " + articleVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);

		return mav;
	} // End - 게시글 번호에 해당하는 상세 정보
	
	
	@RequestMapping(value="/sale/viewArticle.do", method=RequestMethod.GET)
	public ModelAndView saleViewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		// 게시글 번호에 해당하는 정보를 모두 가져온다.
		saleArticleVO = boardService.saleViewArticle(articleNO);
		
		System.out.println("--------BoardControllerImpl viewArticle() : " + saleArticleVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", saleArticleVO);

		return mav;
	} // End - 게시글 번호에 해당하는 상세 정보

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/buy/removeArticle.do", method=RequestMethod.POST)
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("BoardControllerImpl 글 삭제하기 ==> " + articleNO);
			
		response.setContentType("text/html;charset=UTF-8");
		String message;
		ResponseEntity	resEnt			= null;
		HttpHeaders		responseHeaders	= new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		
		try {
			// 게시글 번호에 해당하는 자료를 DB에서 지운다.
			boardService.buyRemoveArticle(articleNO);
			
			// 사진도 삭제한다.
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
			FileUtils.deleteDirectory(destDir);
		
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/buy/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/buy/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		} // End - try ~ catch
		
		return resEnt;
		
	} // End - 게시글 번호에 해당하는 글 삭제하기
	
	
	@RequestMapping(value="/sale/removeArticle.do", method=RequestMethod.POST)
	public ResponseEntity saleRemoveArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("BoardControllerImpl 글 삭제하기 ==> " + articleNO);
			
		response.setContentType("text/html;charset=UTF-8");
		String message;
		ResponseEntity	resEnt			= null;
		HttpHeaders		responseHeaders	= new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		
		try {
			// 게시글 번호에 해당하는 자료를 DB에서 지운다.
			boardService.saleRemoveArticle(articleNO);
			
			// 사진도 삭제한다.
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
			FileUtils.deleteDirectory(destDir);
		
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/sale/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/sale/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		} // End - try ~ catch
		
		return resEnt;
		
	} // End - 게시글 번호에 해당하는 글 삭제하기

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 글 수정하기
	//-----------------------------------------------------------------------------------------------------------
	
	@ResponseBody
	@RequestMapping(value="/buy/modArticle.do", method=RequestMethod.POST)
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		System.out.println("수정반영하기 시작.....");
		multipartRequest.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= multipartRequest.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String thumbnail	= upload(multipartRequest);
		articleMap.put("thumbnail", thumbnail);
		
		String 	articleNO	= (String) articleMap.get("articleNO");
		String	message;
		
		System.out.printf("thumbnail : %s", thumbnail);
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		//-----------------------------------------------------------------------------------------------------------
		// 임시폴더(C:\\data\\board\\article_image\\temp)에 imageFileName이라는 파일이 존재하면 작동하지 않는다.
		//-----------------------------------------------------------------------------------------------------------
		try {
			boardService.buyModArticle(articleMap);
			
			if(thumbnail != null && thumbnail.length() != 0) {
				File srcDir  = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveToDirectory(srcDir, destDir, true);
				
				String	originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
				oldFile.delete();
			}
			message	 = "<script>";
			message	+= "alert('게시글을 수정하였습니다.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/buy/viewArticle.do?articleNO=" + articleNO + "';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
			srcFile.delete();
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/buy/viewArticle.do?articleNO=" + articleNO + "';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	} // End - public ResponseEntity modArticle()
	
	
	@ResponseBody
	@RequestMapping(value="/sale/modArticle.do", method=RequestMethod.POST)
	public ResponseEntity saleModArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		System.out.println("수정반영하기 시작.....");
		multipartRequest.setCharacterEncoding("UTF-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= multipartRequest.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String thumbnail	= upload(multipartRequest);
		articleMap.put("thumbnail", thumbnail);
		
		String 	articleNO	= (String) articleMap.get("articleNO");
		String	message;
		
		System.out.printf("thumbnail : %s", thumbnail);
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		//-----------------------------------------------------------------------------------------------------------
		// 임시폴더(C:\\data\\board\\article_image\\temp)에 imageFileName이라는 파일이 존재하면 작동하지 않는다.
		//-----------------------------------------------------------------------------------------------------------
		try {
			boardService.saleModArticle(articleMap);
			
			if(thumbnail != null && thumbnail.length() != 0) {
				File srcDir  = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveToDirectory(srcDir, destDir, true);
				
				String	originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
				oldFile.delete();
			}
			message	 = "<script>";
			message	+= "alert('게시글을 수정하였습니다.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/sale/viewArticle.do?articleNO=" + articleNO + "';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + thumbnail);
			srcFile.delete();
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multipartRequest.getContextPath() + "/sale/viewArticle.do?articleNO=" + articleNO + "';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	} // End - public ResponseEntity modArticle()

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 (페이징) 화면 보여주기 + 검색조건(SearchCriteria)
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/buy/listArticles.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticlesPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri)
			throws Exception {

		String	viewName	= (String)request.getAttribute("viewName");
		ModelAndView	mav			= new ModelAndView(viewName);
		
		PageMaker 		pageMaker	= new PageMaker();
		pageMaker.setCri(cri);
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		// System.out.println("총 게시물 개수 : " + boardService.boardListTotalCount(cri));
		pageMaker.setTotalCount(boardService.buyListTotalCount(cri));
		logger.info("게시물의 총 건수 : " + pageMaker.getTotalCount());
		
		// 화면에 출력할 데이터를 가져온다.
		List<ArticleVO> list = boardService.buyListPaging(cri);
		System.out.println("리스트:" + list);
		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("###### PageMaker ==> " + pageMaker);
		
		mav.addObject("articlesList", 	list);   // >> list를 담아서 넘김
		mav.addObject("pageMaker",		pageMaker);
		mav.addObject("cri",			cri);
		
		return mav;
		
	} // End - 게시글 목록 (페이징) 화면 보여주기 
	
	
	@RequestMapping(value="/sale/listArticles.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView saleListArticlesPaging(HttpServletRequest request, HttpServletResponse response, SearchCriteria cri)
			throws Exception {

		String	viewName	= (String)request.getAttribute("viewName");
		ModelAndView	mav			= new ModelAndView(viewName);
		
		PageMaker 		pageMaker	= new PageMaker();
		pageMaker.setCri(cri);
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		// System.out.println("총 게시물 개수 : " + boardService.boardListTotalCount(cri));
		pageMaker.setTotalCount(boardService.saleListTotalCount(cri));
		logger.info("게시물의 총 건수 : " + pageMaker.getTotalCount());
		
		// 화면에 출력할 데이터를 가져온다.
		List<SaleArticleVO> list = boardService.saleListPaging(cri);
		System.out.println("리스트:" + list);
		
		// pageMaker의 정보를 콘솔에 보여준다.
		System.out.println("###### PageMaker ==> " + pageMaker);
		
		mav.addObject("saleArticlesList", 	list);   // >> list를 담아서 넘김
		mav.addObject("pageMaker",		pageMaker);
		mav.addObject("cri",			cri);
		
		return mav;
		
	} // End - 게시글 목록 (페이징) 화면 보여주기 
	
	// 구매완료
	@ResponseBody
	@RequestMapping(value="/buy/buyEnd", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity buyNow(HttpServletRequest Request, HttpServletResponse response)
			throws Exception {

		System.out.println("구매완료");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = Request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= Request.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String 	articleNO	= (String) articleMap.get("articleNO");
		String	message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		//-----------------------------------------------------------------------------------------------------------
		// 임시폴더(C:\\data\\board\\article_image\\temp)에 imageFileName이라는 파일이 존재하면 작동하지 않는다.
		//-----------------------------------------------------------------------------------------------------------
		try {
			boardService.buyNow(articleMap);
			
			message	 = "<script>";
			message	+= "location.href='" + Request.getContextPath() + "/buy/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + Request.getContextPath() + "/buy/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@ResponseBody
	@RequestMapping(value="/sale/saleEnd", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity saleNow(HttpServletRequest Request, HttpServletResponse response)
			throws Exception {

		System.out.println("구매완료");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = Request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String	name	= (String) enu.nextElement();
			String	value	= Request.getParameter(name);
			System.out.println(name + ":" + value);
			articleMap.put(name, value);
		}
		
		String 	articleNO	= (String) articleMap.get("articleNO");
		String	message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		//-----------------------------------------------------------------------------------------------------------
		// 임시폴더(C:\\data\\board\\article_image\\temp)에 imageFileName이라는 파일이 존재하면 작동하지 않는다.
		//-----------------------------------------------------------------------------------------------------------
		try {
			boardService.saleNow(articleMap);
			
			message	 = "<script>";
			message	+= "location.href='" + Request.getContextPath() + "/sale/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + Request.getContextPath() + "/sale/listArticles.do';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}	

} // End - public class BoardControllerImpl implements BoardController




