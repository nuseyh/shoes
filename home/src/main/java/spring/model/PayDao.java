package spring.model;


public interface PayDao {
//	결제내역추가
//	 boolean insert(Pay pay);

	boolean insert(String payid, int product_no, int product_price, int product_size, String product_color,
			int count, int amount);
}
