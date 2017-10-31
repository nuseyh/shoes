package spring.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.bean.Cart;
import spring.model.CartDao;
import spring.model.ProductDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cdao;

	@RequestMapping("/cart_list")
	public String cart_list(HttpSession session, HttpServletRequest request) {
		String user_id = (String) session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Cart> clist = cdao.cart_list(user_id);
		int total = cdao.total(user_id);
		//총 주문액이 십만원 이하면 배송비 부가
		int fee = total >= 100000 ? 0 : 2500;
		
		//리스트에 상품의 이미지와 상품이름 가격이 필요
		
		map.put("clist", clist);                // 장바구니 정보를 map에 저장
		map.put("count", clist.size());        // 장바구니 상품의 유무
		map.put("total", total);  		      // 장바구니 전체 금액
		map.put("fee", fee);                 // 배송금액
		map.put("allSum", total+fee);	    // 주문 상품 전체 금액
		
		request.setAttribute("map", map);
		
		return "cart/cart_list";
	}
	
	@RequestMapping(value="/cart_add",method=RequestMethod.POST)
	public String cart_add(HttpServletRequest request) {
		Cart cart = cdao.insert(new Cart(request));
		String user_id = (String) request.getAttribute("user_id");
		request.setAttribute("cart", cart);
		return "redirect:cart_list";
	}
	
	
}
