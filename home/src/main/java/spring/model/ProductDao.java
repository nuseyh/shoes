package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Product;

@Repository
public interface ProductDao {
	List<Product> plist(String type);
	void insert(Product product);
	Product detail(int no);
	Product get(String savename);
}
