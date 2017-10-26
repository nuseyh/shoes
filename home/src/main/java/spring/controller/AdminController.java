package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	// @RequestMapping("/memberlist")
	// public String memberlist() {
	// return "admin/memberlist";
	// }

	// 회원 목록 리스트
	@RequestMapping({ "/memberlist", "/memberlist/" })
	public String memberlist(Model model) {
		model.addAttribute("list", adminDao.list());
		return "admin/memberlist";
	}

	// 회원 검색
	@RequestMapping("/memberlist/{key}")
	public String memberlist(Model model, @PathVariable String key) {
		model.addAttribute("list", adminDao.search(key));
		return "admin/memberlist";
	}

	// 회원 삭제
	@RequestMapping(value = {"/memberlist","/memberlist/{key}"}, method = RequestMethod.POST)
	public String deletemember(HttpServletRequest request, Model model) {
		model.addAttribute("list", adminDao.list());
		String[] check = request.getParameterValues("check");
		System.out.println(check.toString());

		for (String check2 : check) {
			System.out.println(check2);
			adminDao.delete(check2);
		}
		return "admin/memberlist2";
	}
	
	
}
