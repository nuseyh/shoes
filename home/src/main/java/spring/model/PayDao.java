package spring.model;

import spring.bean.Pay;

public interface PayDao {
	//결제내역추가
	 boolean insert(Pay pay);
}
