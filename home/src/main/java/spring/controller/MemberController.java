package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.bean.Member;
import spring.model.MemberDao;

@Controller
@RequestMapping("/member")
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
	// @RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	// public boolean idcheck(HttpServletRequest request, Member m) {
	// String id = request.getParameter("id");
	// System.out.println(id);
	// boolean result = memberDao.idcheck(id);
	//
	// return result;
	//
	// }

	// 아이디 찾기
	@RequestMapping("/idsearch")
	public String idsearch() {
		return "member/idsearch";
	}

	@RequestMapping(value = "/idsearch", method = RequestMethod.POST)
	public String idsearch(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String id = memberDao.idsearch(name, email);
		System.out.println(id);
		if (id != null) {
			model.addAttribute("searchid", id);
		}

		return "member/idsearch2";

	}
	
	@RequestMapping("/pwsearch")
	public String pwsearch() {
		return "member/pwsearch";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		boolean result = memberDao.login(m);

		if (!result) {

			model.addAttribute("false");
			return "member/loginer";

		} else {
			session.setAttribute("login", true);
			session.setAttribute("id", m.getId());
			return "redirect:/";
		}

	}

	// mypage
	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}

	// profile
	@RequestMapping("/profile")
	public String profile(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("mdto", memberDao.profile(id));

		return "member/profile";
	}

	// edit
	@RequestMapping("/edit")
	public String edit(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("mdto", memberDao.profile(id));
		return "member/edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(Member m) {
		memberDao.edit(m);
		return "member/profile";
		
	}

	// 회원탈퇴
	@RequestMapping("/delete")
	public String delete() {

		return "member/delete";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw");

		if (memberDao.delete(id, pw)) {
			model.addAttribute("delete");
			session.invalidate();
		}
		return "member/delete2";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		return "home";
	}

}
