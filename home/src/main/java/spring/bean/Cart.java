package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Cart {
	private int cart_no;
	private String user_id;
	private int product_no;
	private int amount;
	
	public Cart(ResultSet rs) throws SQLException{
		setCart_no(rs.getInt("cart_no"));
		setUser_id(rs.getString("user_id"));
		setProduct_no(rs.getInt("product_no"));
		setAmount(rs.getInt("amount"));
	}
	public Cart(HttpServletRequest request) {
		String cart_no = request.getParameter("cart_no");
		setCart_no(cart_no==null?0:Integer.parseInt(cart_no));
		setUser_id(request.getParameter("user_id"));
		String product_no = request.getParameter("product_no");
		setProduct_no(product_no==null?0:Integer.parseInt(product_no));
		String amount = request.getParameter("amount");
		setAmount(amount==null?0:Integer.parseInt(amount));
	}

	public Cart(int cart_no, String user_id, int product_no, int amount) {
		super();
	}
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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
	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", user_id=" + user_id + ", product_no=" + product_no + ", amount=" + amount
				+ "]";
	}
	
	
	
}
