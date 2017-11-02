package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.bean.Product;
import spring.model.ProductDao;

@Controller
public class HomeController {
	
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping({"/", "", "/home"})
	public String home(Model model) {
		List<Product> list = pdao.plist("all");
		model.addAttribute("plist", list);
		return "/home";
	}
}






