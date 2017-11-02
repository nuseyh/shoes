package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Pay {
	private int pay_no;
	private String user_id;
	private int product_no;
	private int amount;

	public Pay(ResultSet rs) throws SQLException{
		setPay_no(rs.getInt("pay_no"));
		setUser_id(rs.getString("user_id"));
		setProduct_no(rs.getInt("product_no"));
		setAmount(rs.getInt("amount"));
	}
	
	public Pay(HttpServletRequest request) {
		String pay_no = request.getParameter("pay_no");
		setPay_no(pay_no==null?0:Integer.parseInt(pay_no));
		setUser_id(request.getParameter("user_id"));
		String product_no = request.getParameter("product_no");
		setProduct_no(product_no==null?0:Integer.parseInt(product_no));
		String amount = request.getParameter("amount");
		setAmount(amount==null?0:Integer.parseInt(amount));
	}
	
	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Pay [pay_no=" + pay_no + ", user_id=" + user_id + ", product_no=" + product_no + ", amount=" + amount
				+ "]";
	}

}
