package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.bean.Board;
import spring.model.BoardDao;
import spring.model.ReplyBoardDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BoardDao bdao;
	@Autowired
	private ReplyBoardDao rbdao;
	
	
	//게시판 리스트
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		int boardsize = 3;//게시판 1p에 표시할 글 개수
		int blocksize = 3;//게시판 1p에 표시할 링크 개수
		
		String key = request.getParameter("key");
		String type = request.getParameter("type");
		
		boolean searchFlag = type != null && key != null;
		
		String pageStr = request.getParameter("page");
		int pageNo;
		try{
			pageNo = Integer.parseInt(pageStr);
			if(pageNo <= 0) throw new Exception();
		}catch(Exception e){
			pageNo = 1;
		}
		
		int count;
		if(searchFlag){
			count = bdao.getBoardCount(type, key);
		}else{
			count = bdao.getBoardCount();
		} 
		
		int start = pageNo * boardsize - boardsize + 1;
		int end = start + boardsize - 1;
		
		int blocktotal = (count - 1) / boardsize + 1;
		int blockstart = (pageNo - 1) / blocksize * blocksize + 1;
		int blockend = blockstart + blocksize - 1;
		if(blockend > blocktotal) blockend = blocktotal;
		
		List<Board> list;
		if(searchFlag){
			list = bdao.search(type, key, start, end); 
		}else{
			list = bdao.list(start, end); 
		}
		
		String searchParam;
		if(searchFlag) searchParam = "&type="+type+"&key="+key;
		else searchParam = "";
		
		//전달할 데이터 첨부
		model.addAttribute("searchFlag", searchFlag);
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("count", count);
		model.addAttribute("blocktotal", blocktotal);
		model.addAttribute("blockstart", blockstart);
		model.addAttribute("blockend", blockend);
		model.addAttribute("list", list);
		model.addAttribute("searchParam", searchParam);
		//nextPage 설정
		return "board/list";
		
	}
	
	//게시판 글쓰기
	@RequestMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(HttpServletRequest request) {
		Board board = new Board(request);
		int no = bdao.insert(board);
		request.setAttribute("no", no);
		return "redirect:detail?no="+no;
	}
	
	//게시글 상세보기
	@RequestMapping("/detail")
	public String detail( @RequestParam("no") int no, HttpServletRequest request) {
		bdao.plusRead(no);
		request.setAttribute("board", bdao.detail(no));
		request.setAttribute("no", no);
		return "board/detail";
	}
	
	//게시글 수정
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, @RequestParam("no") int no) {
		request.setAttribute("board", bdao.detail(no));
		return "board/edit";
	}
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(@RequestParam("no") int no, @RequestParam("detail") String detail, @RequestParam("pw") String pw, HttpServletRequest request) {
		Board board = bdao.detail(no);
		bdao.edit(board, detail, pw);
		request.setAttribute("board", bdao.detail(no));
		return "redirect:detail?no="+no;
	}
	
	
	//게시글 비밀번호 입력
	@RequestMapping("/password")
	public String password(@RequestParam("no") int no, HttpServletRequest request) {
		request.setAttribute("no", no);
		return "board/password";
	}
	@RequestMapping(value="/password", method=RequestMethod.POST)
	public String password(@RequestParam("no") int no, Model model) {
		Board board = bdao.detail(no);
		model.addAttribute("no", no);
		
		if(bdao.password(board)) {
			return "redirect:detail";
		}else {
			return "redirect:password";
		}
	}
	
	//게시글 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam("no") int no) {
		bdao.delete(no);
		return "redirect:list";
	}
	
	
}
