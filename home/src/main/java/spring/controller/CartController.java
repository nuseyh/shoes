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
		int total = cdao.total(user_id);
		//총금액에 따라서 배송이 부여 여부
		int fee = total >= 100000 ? 0 : 2500;
		
		request.setAttribute("clist", clist);
		request.setAttribute("total", total);
		request.setAttribute("fee", fee);
		
		
//		String user_id = (String) session.getAttribute("id");
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		List<Cart> clist = cdao.cart_list(user_id);
//		List<Product> plist = pdao.plist("all");
//		//리스트에 상품의 이미지와 상품이름 가격이 필요
//		System.out.println(clist);
//		System.out.println(plist);
//		
//		map.put("clist", clist);                // 장바구니 정보를 map에 저장
//		map.put("plist", plist);
//		map.put("count", clist.size());        // 장바구니 상품의 유무
//		map.put("total", total);  		      // 장바구니 전체 금액
//		map.put("fee", fee);                 // 배송금액
//		map.put("allSum", total+fee);	    // 주문 상품 전체 금액
//		
//		request.setAttribute("map", map);
		
		return "cart/cart_list";
	}
	
	@RequestMapping(value="/cart_add",method=RequestMethod.POST)
	public String cart_add(HttpServletRequest request) {
		cdao.insert(new Cart(request));
		
		return "redirect:cart_list";
	}
	
	
}
