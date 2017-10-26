package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Member;

@Repository(value = "AdminDao")
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Member> mapper = new RowMapper<Member>() {
		@Override
		public Member mapRow(ResultSet rs, int index) throws SQLException {
			return new Member(rs);
		}
	};
	private ResultSetExtractor<Member> extractor = new ResultSetExtractor<Member>() {
		@Override
		public Member extractData(ResultSet rs) throws SQLException, DataAccessException {
			// return rs.next()?new Member(rs):null;
			if (rs.next())
				return new Member(rs);
			else
				return null;
		}
	};

	public List<Member> list() {
		String sql = "select * from member where power != '관리자' order by reg";
		return jdbcTemplate.query(sql, mapper);
	}

	// 회원 검색
	public List<Member> search(String key) {
		String sql = "select * from member " + "where power != '관리자' and id like ? or name like ? " + "order by reg";
		Object[] args = { "%" + key + "%", "%" + key + "%" };
		return jdbcTemplate.query(sql, args, mapper);
	}


	@Override
	public boolean delete(String check2) {
		String sql = "delete member where id=?";

		Object[] args = {check2};

		return jdbcTemplate.update(sql, args) > 0;
	}

}
