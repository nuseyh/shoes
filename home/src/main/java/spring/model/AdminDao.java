package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Member;
import spring.bean.Product;


@Repository
public interface AdminDao {
	// 관리자 기능
	List<Member> list();
	public List<Member> search(String key);
	
	boolean delete(String check2);
	
	//상품메뉴
	void insert(Product product);
	List<Product> plist();
	Product get(String savename);
}