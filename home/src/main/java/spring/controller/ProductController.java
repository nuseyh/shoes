package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.bean.Board;
import spring.bean.Product;
import spring.model.BoardDao;
import spring.model.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private BoardDao bdao;
	
	@RequestMapping("/list")
	public String plist(@RequestParam("type") String type, HttpServletRequest request, Model model) {
		List<Product> list = pdao.plist(type);
		model.addAttribute("plist", list);
		return "product/list";
	}

	//상품후기리스트
	@RequestMapping("/detail")
	public String detail(@RequestParam("no") int no, HttpServletRequest request, Model model){
//		System.out.println("no="+no);
		
		request.setAttribute("product", pdao.detail(no));
		List<Board> list = bdao.list(no);
		model.addAttribute("blist", list);
		request.setAttribute("no", no);
//		System.out.println("blist ?" + list);
		return "product/detail";
	}
	
	//상품후기등록
	@RequestMapping(value= "/review_board", method=RequestMethod.POST)
	public String review_board(HttpServletRequest request) {
		Board board = new Board(request);
		int product_no = bdao.insert(board, board.getProduct_no());
		return "redirect:detail?no="+product_no;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("no") int no, @RequestParam("product_no") int product_no) {
		System.out.println("no =" +no);
		bdao.delete(no);
		return "redirect:detail?no="+product_no;
	}
	
	
}
