package com.ezen.auction.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/auction")
public class ImgFilesController {
	
	private static final String IMGROOT = "C:\\data\\workspace\\DonberlyProject\\src\\main\\webapp\\resources\\images\\auction\\auction_image";
	
	//파일 불러오기
	@RequestMapping("/pullAuctionImges")
	protected void pullImgFiles(@RequestParam("aucImg")	String aucImg,
							@RequestParam("aucCode") int aucCode,
							HttpServletResponse response)	throws Exception {
								
		OutputStream out = response.getOutputStream();
		String downFile	 = IMGROOT + "\\" + aucCode + "\\" + aucImg;
		File file = new File(downFile);
	
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + aucImg);
	
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
	
}
