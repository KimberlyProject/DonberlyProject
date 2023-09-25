package com.ezen.board.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//-----------------------------------------------------------------------------------------------------------
// 이미지 파일 다운로드
//-----------------------------------------------------------------------------------------------------------
@Controller
public class FileDownloadController {

	//-----------------------------------------------------------------------------------------------------------
	// 업로드된 폴더와 위치가 같아야 한다.
	//-----------------------------------------------------------------------------------------------------------
	private static final String ARTICLE_IMAGE_REPO = "C://data\\workspace\\DonberlyProject\\src\\main\\webapp\\resources\\images\\board\\article_image";
	//private static final String ARTICLE_IMAGE_REPO = "tomcat/webapps/DonberlyProject/resources/images/board/article_image";
	
	//-----------------------------------------------------------------------------------------------------------
	// 이미지 파일 다운로드
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping("/download.do")
	protected void download(@RequestParam("thumbnail")	String thumbnail,
							@RequestParam("articleNO")		String articleNO,
							HttpServletResponse response)	throws Exception {
								
		OutputStream out = response.getOutputStream();
		String downFile	 = ARTICLE_IMAGE_REPO + "/" + articleNO + "/" + thumbnail;
		File file = new File(downFile);
	
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + thumbnail);
	
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
		
	} // End - 이미지 파일 다운로드

} // End - public class FileDownloadController






