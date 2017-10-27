package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.bean.Product;
import spring.model.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping("/list")
	public String plist(@RequestParam("type") String type, HttpServletRequest request, Model model) {
		List<Product> list = pdao.plist(type);
		model.addAttribute("plist", list);
		return "product/list";
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam("no") int no, HttpServletRequest request){
		request.setAttribute("product", pdao.detail(no));
		request.setAttribute("no", no);
		return "product/detail";
	}
}
