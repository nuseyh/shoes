package spring.model;

import java.util.Properties;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * 테스트 코드는 크게 2가지로 나눌 수 있다 - 단순한 실행코드 테스트 - 필요 항목이 존재하는 테스트
 */
public class EmailService {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Test // main처럼 실행
	public void send(String email, String tempPw) {
		log.debug("send가 실행");

		// java에서 메일을 보내는 방법은 많지만 Spring에서 제공하는 것을 이용
		// 필요한 depedency : javax.mail.mail, spring-context-support :

		// 전송 도구 생성
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com"); // 메일 서버의 ip
		sender.setPort(25);
		sender.setUsername("nnuseyh@gmail.com");
		sender.setPassword("Tjs2200513!");

		// 추가 옵션 설정
		Properties options = new Properties();
		options.put("mail.transport.protocol", "smtp");
		options.put("mail.smtp.auth", "true");
		options.put("mail.debug", "true"); // 생략 가능
		options.put("mail.smtp.starttls.enable", "true");

		// sender에 options 설정
		sender.setJavaMailProperties(options);

		// 메세지 생성
		SimpleMailMessage message = new SimpleMailMessage();

		// 내용설정 (보내는 사람, 받는 사람, 참조, 숨은참조, 제목, 내용, 첨부파일)
		message.setFrom("shoes");

		message.setTo(email);

		// 참조 : setCc(), 숨은참조 : setBcc()
		message.setSubject("임시비밀번호");
		message.setText("임시비밀번호는"+tempPw+"입니다");

		// 전송명령 : sender.send(메세지);
		sender.send(message);
		log.debug("전송완료");
	}
}