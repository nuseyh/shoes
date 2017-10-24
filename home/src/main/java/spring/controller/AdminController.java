package spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping("/home")
	public String home() {
		return "admin/home";
	}
	
//	@RequestMapping("/memberlist")
//	public String memberlist() {
//		return "admin/memberlist";
//	}
	
	//회원 목록 리스트
	@RequestMapping({"/memberlist", "/memberlist/"})
	public String memberlist(Model model) {
		model.addAttribute("list", adminDao.list());
		return "admin/memberlist";
	}
	
	//회원 검색
	@RequestMapping("/memberlist/{key}")
	public String memberlist(Model model, @PathVariable String key) {
		model.addAttribute("list", adminDao.search(key));
		return "admin/memberlist";
	}
}
