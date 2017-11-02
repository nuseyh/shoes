package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class Board {
	private int no;
	private String state;
	private String title;
	private String writer;
	private String detail;
	private String pw;
	private String reg;
	
	private int read;

	private int gno;
	private int parent;
	private int depth;
	
	private int product_no;
	private String notice;

	public Board() {
		super();
	}
	
	public Board(ResultSet rs) throws SQLException{
		setNo(rs.getInt("no"));
		setState(rs.getString("state"));
		setTitle(rs.getString("title"));
		setWriter(rs.getString("writer"));
		setDetail(rs.getString("detail"));
		setPw(rs.getString("pw"));
		setReg(rs.getString("reg"));
		setRead(rs.getInt("read"));
		
		setGno(rs.getInt("gno"));
		setParent(rs.getInt("parent"));
		setDepth(rs.getInt("depth"));
		
		setProduct_no(rs.getInt("product_no"));
		setNotice(rs.getString("notice"));
	}
	
	public Board(HttpServletRequest request) {
		String no = request.getParameter("no");
		setNo(no==null?0:Integer.parseInt(no));
		setState(request.getParameter("state"));
		setTitle(request.getParameter("title"));
		setWriter(request.getParameter("writer"));
		setDetail(request.getParameter("detail"));
		setPw(request.getParameter("pw"));
		setReg(request.getParameter("reg"));
		String read = request.getParameter("read");
		setRead(read==null?0:Integer.parseInt(read));
		
		String gno = request.getParameter("gno");
		setGno(gno==null?0:Integer.parseInt(gno));
		String parent = request.getParameter("parent");
		setParent(parent==null?0:Integer.parseInt(parent));
		String depth = request.getParameter("depth");
		setDepth(depth==null?0:Integer.parseInt(depth));
		
		String product_no = request.getParameter("product_no");
		setProduct_no(product_no==null?0:Integer.parseInt(product_no));
		
		setNotice(request.getParameter("notice"));
	}
	
	
	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getState() {
		return (state.equals("expected"))?"답변예정":"답변완료";
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWeb() {
		return detail.replace("\n", "<br>");
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getReg() {
		return reg;
	}

	public String getDate() {
		return reg.substring(0, 10);
	}

	public String getTime() {
		return reg.substring(11, 16);
	}

	public String getAuto() {// 인공지능 알파고 날짜 반환 메소드
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if (getDate().equals(today)) {
			return getTime();
		} else {
			return getDate();
		}
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", state=" + state + ", title=" + title + ", writer=" + writer + ", detail=" + detail
				+ ", pw=" + pw + ", reg=" + reg + ", read=" + read + ", gno=" + gno + ", parent=" + parent + ", depth="
				+ depth + ", notice=" + notice + "]";
	}

	
}
