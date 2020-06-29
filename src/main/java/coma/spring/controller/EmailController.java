package coma.spring.controller;

import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mail/")
public class EmailController {

	@Inject
	JavaMailSender mailSender; 


	//mailSending 랜덤 문자열 생성하기
	public String getRandomString(){
		char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};

		StringBuffer sb = new StringBuffer();
		Random rn = new Random();

		for( int i = 0 ; i < 15 ; i++ ){
			sb.append( charaters[ rn.nextInt( charaters.length ) ] );
		}
		return sb.toString();
	}

	//회원가입시 인증 메일 보내기
	@RequestMapping("mailSending")
	@ResponseBody
	public String mailSender(@RequestParam String account_email) throws AddressException, MessagingException { 
		String username = "jieun1092";
		String password = "ji1jin0eat3";

		String dice = this.getRandomString();
		System.out.println("랜덤문자열 : " + dice);

		String recipient = account_email;
		String subject = "맛집갔다갈래 회원가입인증 이메일입니다.";
		String body = dice + " 인증문자열를 이메일 인증란에 입력하여주시기 바랍니다.";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.daum.net");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("no-reply@eat-together.net"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(account_email));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);

			System.out.println("OK");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

		return dice;
	}

}
