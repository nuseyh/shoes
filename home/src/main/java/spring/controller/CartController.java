package spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Cart;
import spring.model.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cdao;
	

	@RequestMapping("/cart_list")
	public String cart_list(HttpSession session, HttpServletRequest request) {
		String user_id = (String) session.getAttribute("id");
		List<Cart> clist = cdao.cart_list(user_id);
		int total=0;
		int fee=0;
		if(clist.size() > 0) {
			total = cdao.total(user_id);
			//총금액에 따라서 배송이 부여 여부
			fee = total >= 100000 ? 0 : 2500;
		}
		fee=0;
		
		request.setAttribute("clist", clist);
		request.setAttribute("total", total);
		request.setAttribute("fee", fee);
		
		
		return "cart/cart_list";
	}
	
	@RequestMapping(value="/cart_add",method=RequestMethod.POST)
	public String cart_add(HttpServletRequest request) {
		Cart cart = new Cart(request);
		System.out.println(cart);
		
		cdao.insert(new Cart(request));
		
		return "redirect:cart_list";
	}
	
	
}
