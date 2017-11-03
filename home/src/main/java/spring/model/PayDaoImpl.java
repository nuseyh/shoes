package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Pay;

@Repository(value = "payDao")
public class PayDaoImpl implements PayDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Pay> mapper = new RowMapper<Pay>() {
		@Override
		public Pay mapRow(ResultSet rs, int index) throws SQLException {
			return new Pay(rs);
		}
	};
	private ResultSetExtractor<Pay> extractor = new ResultSetExtractor<Pay>() {
		@Override
		public Pay extractData(ResultSet rs) throws SQLException, DataAccessException {
			// return rs.next()?new Member(rs):null;
			if (rs.next())
				return new Pay(rs);
			else
				return null;
		}
	};
	
	@Override
	public boolean insert(String payid, int product_no, int product_price, int product_size, String product_color,int count, int amount) {
		System.out.println(payid+" "+ product_no+" "+ product_price+" "+ product_size+" "+ product_color+" "+ count+" "+ amount);
		String sql = "insert into pay values(pay_seq.nextval,?,?,?,?,?,?,?)";
		System.out.println(sql);
		Object[] obj = {payid, product_no,product_price,product_size,product_color,count,amount};
		int result = jdbcTemplate.update(sql, obj);
		System.out.println(result);
		
		return result>0;
	}

}
