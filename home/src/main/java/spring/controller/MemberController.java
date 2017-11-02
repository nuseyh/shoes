package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.bean.Member;
import spring.model.EmailService;
import spring.model.MemberDao;
import spring.model.StringUtil;
import spring.service.Service;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private Service sec;

	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}

	// �쉶�썝 媛��엯 泥섎━(/register, post)
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member m) {
		m.setPw(sec.encodingPw(m.getPw()));
		memberDao.join(m);
		return "member/joiner";
	}

	// �븘�씠�뵒 以묐났 寃��궗
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(HttpServletRequest request, Member m) {
		String id = request.getParameter("user_id");
		System.out.println(id);
		int result = memberDao.idcheck(id);
		System.out.println(result);

		return String.valueOf(result);

	}

	// �씠硫붿씪 以묐났寃��궗
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailcheck(HttpServletRequest request, Member m) {
		String email = request.getParameter("user_email");
		System.out.println(email);
		int result = memberDao.emailcheck(email);
		System.out.println(result);

		return String.valueOf(result);

	}

	// �븘�씠�뵒 李얘린
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

	@RequestMapping(value = "/pwsearch", method = RequestMethod.POST)
	public String pwsearch(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");

		boolean result = memberDao.pwsearch(id, email);
		System.out.println(result);

		String tempPw = StringUtil.createRandomString(10);
		if (result) {

			String tempPw2 = sec.encodingPw(tempPw);
			System.out.println(tempPw2);

			memberDao.temp(tempPw2, id);

			EmailService e = new EmailService();
			e.send(email, tempPw);

		}

		return "member/pwsearch2";

	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		m.setPw(sec.encodingPw(m.getPw()));
		System.out.println(m.getPw());
		boolean result = memberDao.login(m);
		m = memberDao.profile(m.getId());

		if (!result) {

			model.addAttribute("false");
			return "member/loginer";

		} else {
			
			
			System.out.println(m);
			session.setAttribute("login", true);
			session.setAttribute("id", m.getId());
			// 로그인시 관리라면 관리자인지를 저장한다.
			// db의 power를 관리자로 명한다
			session.setAttribute("power", m.getPower());
			System.out.println(m.getPower());
			// session.setAttribute("power", "관리자");
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

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(Member m, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String pw = sec.encodingPw(m.getPw());

		System.out.println(pw);
		m.setPw(pw);

		model.addAttribute("mdto", memberDao.profile(id));
		memberDao.edit(m);
		return "member/profile";
	}

	// �쉶�썝�깉�눜
	@RequestMapping("/delete")
	public String delete() {
		return "member/delete";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String pwcheck = sec.encodingPw(request.getParameter("pw"));
		System.out.println(pwcheck);

		String pw = sec.encodingPw(request.getParameter("pw"));

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
