package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.EmailService;
import spring.model.MemberDao;

@RequestMapping("/email")
public class EmailController {
	@Autowired
	private EmailService Semail;
	
	@Autowired
	private MemberDao memberdao;
	
	@RequestMapping("/send")
	public String send(@RequestParam("email") String email, @RequestParam("id") String id) {
		memberdao.temp(id);
		System.out.println(email);
		System.out.println(id);
		Semail.send(email, id);
		
		
		return "";
	}
	
}
