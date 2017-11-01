package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Cart;

@Repository(value = "cartDao")
public class CartDaoImpl implements CartDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	private RowMapper<Cart> mapper = (rs, index) -> {
		return new Cart(rs);
	};
	
	//장바구니 추가
	@Override
	public Cart insert(Cart cart) {
		String sql = "select cart_seq.nextval from dual";
		int no = jdbcTemplate.queryForObject(sql, Integer.class);
		
		//등록하려는 상품이 이미 있는지 검사후 있으면 수량 변경, 없으면 등록
		boolean result = cart_count(cart.getProduct_no(), cart.getUser_id());
//		System.out.println("같은 상품 잇냐? "+ result);
		
//		if(result) {
//			cart_update(cart);
//		}else {
			sql = "insert into cart values(?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
			Object[] obj = {no, cart.getUser_id(), cart.getProduct_no(), cart.getProduct_name(), cart.getProduct_price(), cart.getCount(), cart.getProduct_price()*cart.getCount()};
			jdbcTemplate.update(sql, obj);
//		}
		return cart;
	}
	//장바구니 목록
	@Override
	public List<Cart> cart_list(String user_id) {
		String sql = "select * from cart where user_id=?";
		Object[] obj = {user_id};
		return jdbcTemplate.query(sql, obj, mapper);
	}
	//장바구니 삭제
	@Override
	public void delete(int cart_no) {
		String sql = "delete cart where chart_no=?";
		Object[] obj = {cart_no};
		jdbcTemplate.update(sql, obj);
	}
	//장바구니 수정
	@Override
	public void edit(Cart cart) {
//		String sql = "update sp_board set detail=?, pw=? where no=?";
//		Object[] obj = {};
//		jdbcTemplate.update(sql, obj);
	}
	//장바구니 금액 합계
	@Override
	public int total(String user_id) {
		String sql = "select sum(amount) from cart where user_id='"+user_id+"'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	
	//장바구니 내의 같은 상품 확인
	@Override
	public boolean cart_count(int product_no, String user_id) {
		String sql = "select * from cart where product_no=? and user_id=?";
		Object[] obj = {product_no, user_id};
		return jdbcTemplate.query(sql, obj, mapper) != null;
	}
	//같은 상품 있을시 수량 변경
	@Override
	public void cart_update(Cart cart) {
		String sql ="update cart set amount=? where user_id=? and product_no=? and cart_no=?";
		Object[] obj = {cart.getAmount(), cart.getUser_id(), cart.getProduct_no(), cart.getCart_no()};
		jdbcTemplate.update(sql, obj);
	}



}
