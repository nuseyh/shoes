package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Member;
import spring.model.MemberDao;

@Controller
@RequestMapping("/pay")
public class PayController {

	@Autowired
	private MemberDao memberDao;

	// 결제
	@RequestMapping("/pay_list")
	public String pay_list(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("mdto", memberDao.profile(id));

		return "pay/pay_list";
	}

	@RequestMapping(value = "/pay_list", method = RequestMethod.POST)
	public String pay_list(HttpServletRequest request, Model model, Member m) {
		HttpSession session = request.getSession();
		session.setAttribute("id", m.getId());
		
		return "pay/paynow";
	}
	
	@RequestMapping("/paynow")
	public String paynow(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("mdto", memberDao.profile(id));

		return "pay/paynow";
	}

}
