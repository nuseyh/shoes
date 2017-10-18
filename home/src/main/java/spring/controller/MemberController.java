package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Member;
import spring.model.MemberDao;

@Controller
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	

	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}


	// 회원 가입 처리(/register, post)
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member m) {
		System.out.println(m);
		memberDao.join(m);
		return "redirect:/";
	}
	
	// 아이디 중복 검사

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Member m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		boolean result = memberDao.login(m);
		if(result) {
			session.setAttribute("login", true);
			if (m.isAdmin()) {

				session.setAttribute("admin", true);
			}
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("login");
		
		return "home";
	}
	
}
