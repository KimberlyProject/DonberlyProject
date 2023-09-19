package com.ezen.admin.controller;


import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin/*")
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
    
	//----------------------------메일발송 JSP 로 이동------------------------
	@RequestMapping(value = "/mailSend", method = RequestMethod.GET)
	public void getMailSend() {
		logger.info("메일발송 JSP진입");
	}
	
	//--------------------------------메일발송-----------------------------
	//mailSend 코드
	@RequestMapping(value = "/mailSend", method = RequestMethod.POST)
	public String mailSend(HttpServletRequest request,String subject,String email,String phone,String message) {
		try {
			
			System.out.println("subject => " + subject);
			System.out.println("email => " + email);
			System.out.println("message => " + message);
			
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		   // MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    System.out.println("Message ===> " + mimeMessage);
		    logger.info("Message {}", mimeMessage);
 
		    //test용 메일 내용
		    messageHelper.setFrom("donberly1111@gmail.com"); 	// 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo(email); 		// 받는사람 이메일
		    messageHelper.setSubject(subject); 	// 메일제목
		    messageHelper.setText(message); 	// 메일 내용
		    
		    // 	messageHelper.setTo("수신메일주소@naver.com"); 	// 받는사람 이메일
		    //	messageHelper.setTo("mr100s1@gmail.com"); 	// 받는사람 이메일
		    //	messageHelper.setSubject("[티켓예약] 안녕하세요 ORDER BY TICKET 입니다" ); // 메일제목
		    //	messageHelper.setText("예약하신 회원님은"+ name + last_name + "입니다."+" 연락처는 " + phone + "입니다. 입력한 Email은 " + email + "입니다."); // 메일 내용
		    //	messageHelper.setText("text/html","<div style='border: 3px solid blue'><a href='https://www.naver.com/'>message</a></div>");
		    //	로그인 폼 테스트HTML ->//messageHelper.setText("text/html","<html> <head> <meta name=\"viewport\" content=\"width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0\"> </head> <body> <header> <h2>Login</h2> </header> <form action=\"\" method=\"POST\"> <div class=\"input-box\"> <input id=\"username\" type=\"text\" name=\"username\" placeholder=\"아이디\"> <label for=\"username\">아이디</label> </div> <div class=\"input-box\"> <input id=\"password\" type=\"password\" name=\"password\" placeholder=\"비밀번호\"> <label for=\"password\">비밀번호</label> </div> <div id=\"forgot\">비밀번호 찾기</div> <input type=\"submit\" value=\"로그인\"> </form> </body> </html>");
		    
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
}