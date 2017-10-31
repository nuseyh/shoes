package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Cart;

@Repository(value = "cartDao")
public class CartDaoImpl implements CartDao{
	//장바구니 추가
	@Override
	public void insert(Cart cart) {
		
	}
	//장바구니 목록
	@Override
	public List<Cart> cart_list(String user_id) {
		return null;
	}
	//장바구니 삭제
	@Override
	public void delete(int cart_no) {
		
	}
	//장바구니 수정
	@Override
	public void edit(Cart cart) {
		
	}
	//장바구니 금액 합계
	@Override
	public int total(String user_id) {
		return 0;
	}
	//장바구니 내의 같은 상품 확인
	@Override
	public int cart_count(int product_no, String user_id) {
		return 0;
	}
	//같은 상품 있을시 수량 변경
	@Override
	public void cart_update(Cart cart) {
		
	}
	
	
	
	
	



}
