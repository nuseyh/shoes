package spring.service;

import org.springframework.stereotype.Repository;

@Repository
public interface Service {
	String encodingPw(String pw);
	void tmepEmail();
}
