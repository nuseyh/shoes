package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Cart;

@Repository
public interface CartDao {
	// 1. 장바구니 추가
    void insert(Cart cart);
	// 2. 장바구니 목록
    List<Cart> cart_list(String user_id);
	// 3. 장바구니 삭제
    void delete(int cart_no);
	// 4. 장바구니 수정
    void edit(Cart cart);
	// 5. 장바구니 금액 합계
    int total(String user_id);
	// 6. 장바구니 상품 확인	detail?
    boolean cart_count(int product_no, String user_id);
	// 7. 장바구니 상품 수량 변경
    void cart_update(Cart cart);

    //장바구니 하나의 모든 정보를 불러온다
    
}
