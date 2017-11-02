package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Pay {
	private int pay_no;
	private String user_id;
	private int product_no;
	private int product_price;
	private int product_size;
	private String product_color;
	private int count;
	private int amount;

	public Pay(ResultSet rs) throws SQLException{
		setPay_no(rs.getInt("pay_no"));
		setUser_id(rs.getString("user_id"));
		setProduct_no(rs.getInt("product_no"));
		setProduct_price(rs.getInt("product_price"));
		setProduct_size(rs.getInt("product_size"));
		setProduct_color(rs.getString("product_color"));
		setCount(rs.getInt("count"));
		setAmount(rs.getInt("amount"));
	}
	
	public Pay(HttpServletRequest request) {
		String pay_no = request.getParameter("pay_no");
		setPay_no(pay_no==null?0:Integer.parseInt(pay_no));
		setUser_id(request.getParameter("user_id"));
		String product_no = request.getParameter("product_no");
		setProduct_no(product_no==null?0:Integer.parseInt(product_no));
		String product_price = request.getParameter("product_price");
		setProduct_price(product_price==null?0:Integer.parseInt(product_price));
		String product_size = request.getParameter("product_size");
		setProduct_size(product_size==null?0:Integer.parseInt(product_size));
		setProduct_color(request.getParameter("product_color"));
		String count = request.getParameter("count");
		setCount(product_no==null?0:Integer.parseInt(count));
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

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	

	public int getProduct_size() {
		return product_size;
	}

	public void setProduct_size(int product_size) {
		this.product_size = product_size;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
