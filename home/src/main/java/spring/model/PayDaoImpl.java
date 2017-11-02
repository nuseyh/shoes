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
	public boolean insert(Pay p) {
		System.out.println(p);
		String sql = "insert ino pay values(pay_seq.nextval,?,?,?,?,?,?,?)";
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql, p.getPay_no(), p.getUser_id(), p.getProduct_no(),p.getProduct_price(), p.getProduct_size(), p.getProduct_color(),p.getCount(), p.getAmount());
		System.out.println(result);
		
		return result>0;
	}

}
