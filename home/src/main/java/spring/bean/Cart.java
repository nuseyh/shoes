package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.Format;

import javax.servlet.http.HttpServletRequest;

public class Cart {
	private int cart_no;
	private String user_id;
	private int product_no;
	private String product_name;
	private int product_price;
	private int count;
	private int amount;
	
	public Cart(ResultSet rs) throws SQLException{
		setCart_no(rs.getInt("cart_no"));
		setUser_id(rs.getString("user_id"));
		setProduct_no(rs.getInt("product_no"));
		setProduct_name(rs.getString("product_name"));
		setProduct_price(rs.getInt("product_price"));
		setCount(rs.getInt("count"));
		setAmount(rs.getInt("amount"));
	}
	public Cart(HttpServletRequest request) {
		String cart_no = request.getParameter("cart_no");
		setCart_no(cart_no==null?0:Integer.parseInt(cart_no));
		setUser_id(request.getParameter("user_id"));
		String product_no = request.getParameter("product_no");
		setProduct_no(product_no==null?0:Integer.parseInt(product_no));
		
		setProduct_name(request.getParameter("product_name"));
		
		String product_price = request.getParameter("product_price");
		setProduct_price(product_price==null?0:Integer.parseInt(product_price));
		
		String count = request.getParameter("count");
		setCount(count==null?0:Integer.parseInt(count));
		String amount = request.getParameter("amount");
		setAmount(amount==null?0:Integer.parseInt(amount));
	}

	
	
	
	public Cart(int cart_no, String user_id, int product_no, String product_name, int product_price, int count,
			int amount) {
		super();
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
		return "Cart [cart_no=" + cart_no + ", user_id=" + user_id + ", product_no=" + product_no + ", product_name="
				+ product_name + ", product_price=" + product_price + ", count=" + count + ", amount=" + amount + "]";
	}
	
	public String getPattern_price() {
		Format form = new DecimalFormat("#,###");
		String patternPrice = form.format(product_price);
		return patternPrice;
	}
	
}
