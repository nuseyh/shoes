package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cdao;
	
	@RequestMapping("/cart")
	public String cart() {
		
		
		
		return "cart/cart_list";
	}
	
	
	
	
}
