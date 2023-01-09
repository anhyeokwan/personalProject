package kr.or.common;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class MailSend {

	public String mailSendMethod(String memberEmail) {
		
		// 결과를 확인할 변수
		boolean result = false;
		
		// 랜덤 숫자를 만드는 객체
		Random r = new Random();

		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < 8; i++) {
			int rNum = r.nextInt(3) + 1;
			if(rNum == 1) {
				int num = r.nextInt(10);
				sb.append(num);
			}else if(rNum == 2) {
				char small = (char)(r.nextInt(26)+65); // 아스키코드 65번부터 90번까지(대문자)
				sb.append(small);
			}else {
				char big = (char)(r.nextInt(26) + 97); // 아스키코드 65번부터 90번까지(대문자)
				sb.append(big);
			}
			
		}
		
		System.out.println(memberEmail);
		
		// 이메일 통신 설정
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host","smtp.naver.com");
	    prop.put("mail.smtp.port", 465); //포트설정
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.ssl.enable", "true");
	    prop.put("mail.smtp.ssl.trust","smtp.naver.com");
	    prop.put("mail.smtp.starttls.required", "true");
	    prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
	    prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    
	    // 인증정보 설정
	    Session session = Session.getDefaultInstance(prop, 
	    		new Authenticator() {
	    			protected PasswordAuthentication getPasswordAuthentication() {
	    				PasswordAuthentication pa = new PasswordAuthentication("bombom841@naver.com", "WJHKR4DH41CV");
	    				
	    				return pa;
	    			}
				}
	    );
	    
	    // 메세지를 작성해서 전송하는 객체
	    MimeMessage mime = new MimeMessage(session);
	    try {
			// 전송하는 날짜
	    	mime.setSentDate(new Date());
			
	    	// 전송하는 사람
	    	mime.setFrom(new InternetAddress("bombom841@naver.com", "안형관 펜션사이트의 메일을 받아라!"));
	    	
	    	// 받는 사람 정보
	    	 InternetAddress ia = new InternetAddress(memberEmail);
	    	 
	    	 mime.setRecipient(Message.RecipientType.TO, ia);
	    	
	    	 // 이메일 제목
	    	 mime.setSubject("안형관 펜션사이트입니다.", "UTF-8");
	    	 
	    	 // 이메일 내용
	    	 mime.setContent("<h1>이메일 인증번호</h1>" + 
	    			 "<p style='color : blue;'>인증번호는 [" + sb.toString() + "]입니다.", "text/html;charset=utf-8");
	    	 
	    	 // 이메일 전송
	    	Transport.send(mime);
	    	result = true;
	    } catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    if(result) {
	    	return sb.toString();
	    }else {
	    	return null;
	    }
	    
	}

}

















