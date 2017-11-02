package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Cart;
import spring.bean.Member;
import spring.model.CartDao;
import spring.model.MemberDao;

@Controller
@RequestMapping("/pay")
public class PayController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CartDao cdao;

	// 결제
	@RequestMapping("/pay_list")
	public String pay_list(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("mdto", memberDao.profile(id));
		
		String user_id = (String) session.getAttribute("id");
		List<Cart> clist = cdao.cart_list(user_id);
		int total=0;
		int fee=0;
		if(clist.size() > 0) {
			total = cdao.total(user_id);
			//총금액에 따라서 배송이 부여 여부
			fee = total >= 100000 ? 0 : 2500;
		}
		
		model.addAttribute("clist", clist);
		model.addAttribute("total", total);
		model.addAttribute("fee", fee);
		model.addAttribute("amount", total+fee);

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
		
		String user_id = (String) session.getAttribute("id");
		List<Cart> clist = cdao.cart_list(user_id);
		int total=0;
		int fee=0;
		if(clist.size() > 0) {
			total = cdao.total(user_id);
			//총금액에 따라서 배송이 부여 여부
			fee = total >= 100000 ? 0 : 2500;
		}
		
		model.addAttribute("clist", clist);
		model.addAttribute("total", total);
		model.addAttribute("fee", fee);
		model.addAttribute("amount", total+fee);
		
		return "pay/paynow";
	}

}
