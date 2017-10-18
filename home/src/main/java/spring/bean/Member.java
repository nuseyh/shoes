package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Member {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String addr1;
	private String addr2;
	private String addr3;
	private int money;
	private String power;
	private String reg;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public Member(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setId(rs.getString("id"));
		setPw(rs.getString("pw"));
		setName(rs.getString("name"));
		setPhone(rs.getString("phone"));
		setEmail(rs.getString("email"));
		setAddr1(rs.getString("addr1"));
		setAddr2(rs.getString("addr2"));
		setAddr3(rs.getString("addr3"));
		setMoney(rs.getInt("money"));
		setPower(rs.getString("power"));
		setReg(rs.getString("reg"));
	}

	public Member(HttpServletRequest request) {
		String no = request.getParameter("no");
		setNo(no == null ? 0 : Integer.parseInt(no));
		setId(request.getParameter("id"));
		setPw(request.getParameter("pw"));
		setName(request.getParameter("name"));
		setPhone(request.getParameter("phone"));
		setEmail(request.getParameter("email"));
		setAddr1(request.getParameter("addr1"));
		setAddr2(request.getParameter("addr2"));
		setAddr3(request.getParameter("addr3"));
		String money = request.getParameter("money");
		setMoney(money == null ? 0 : Integer.parseInt(money));
		setPower(request.getParameter("power"));
		setReg(request.getParameter("reg"));
	}

	// 
	public boolean isAdmin() {
		if (power != null && power.equals("°ü¸®ÀÚ"))
			return true;
		else
			return false;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", money=" + money + ", power="
				+ power + ", reg=" + reg + "]";
	}
}
