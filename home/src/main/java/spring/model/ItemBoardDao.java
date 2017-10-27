package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Product;

@Repository
public interface ItemBoardDao {
	void insert(Product product);
	List<Product> list();
	Product get(String savename);
//	void remove(Product product);
	boolean remove(String check2);
//ㅇ ㄹㅇ11
}
