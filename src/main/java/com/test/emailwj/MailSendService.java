package com.test.emailwj;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender; //인증번호를 전송해주는 이메일 설정 매핑
	private int authNumber; 
		public void makeRandomNumber() {
			//이메일 인증번호(난수) 생성메서드
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			authNumber = checkNum;
		}
		
		
				//이메일 보낼 양식
		public String joinEmail(String email) {	
			makeRandomNumber(); //이메일 인증번호(난수) 생성
			String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "DreamJourney 회원 가입 인증 이메일 입니다."; // 이메일 제목 
			String content = 
					"<h1>드림저니에 회원가입을 해주셔서 감사합니다.</h1>" + 	//html 형식으로 작성 !  
	                "<h2>인증 번호는 <span style=\"color:tomato;\">" + authNumber + "</span> 입니다.</h2>" +
				    "<br>" + 
				    "<h2>해당 인증번호를 인증번호 확인란에 기입하여 주세요.</h2>"; //이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return Integer.toString(authNumber);
		}
		
		//이메일 전송 메소드
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
				helper.setText(content,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
	
}