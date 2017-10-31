package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.bean.Cart;
import spring.model.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cdao;
	
	@RequestMapping("/cart_list")
	public String cart_list() {
		return "cart/cart_list";
	}
	
	@RequestMapping("/cart_add")
	public String cart_add(HttpServletRequest request) {
		Cart cart = cdao.insert(new Cart(request));
		
		System.out.println(cart);
		
		return "cart/cart_list?user=";
	}
	
	
	
	
}
