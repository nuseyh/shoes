package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Member;

@Repository(value = "memberDao")
public class MemberDaoImpl implements MemberDao {

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

	public boolean login(Member m) {
		String sql = "select count(*) from member where id=? and pw=?";
		Object[] args = { m.getId(), m.getPw() };
		int result = jdbcTemplate.queryForObject(sql, Integer.class, args);
		return result > 0;
	}

	@Override
	public boolean join(Member m) {
		System.out.println(m);
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,0,'일반',sysdate)";
		System.out.println(sql);
		int result = jdbcTemplate.update(sql, m.getId(), m.getPw(), m.getName(), m.getPhone(), m.getEmail(),
				m.getAddr1(), m.getAddr2(), m.getAddr3());
		System.out.println(result);
		return result > 0;
	}

	// public boolean idcheck(String id) {
	// String sql = "select * from member where id=?";
	// Object[] args = {id};
	// int result = jdbcTemplate.queryForObject(sql, Integer.class, args);
	//
	// return result > 0;
	//
	// }
	//
	public String idsearch(String name, String email) {
		String sql = "select id from member where name=? and email=?";
		// Object[] args = {name, email};
		String id = jdbcTemplate.queryForObject(sql, String.class, name, email);
		System.out.println(id);
		return id;
	}

	// 비밀번호 찾기
	public boolean pwsearch(String id, String email) {
		String sql = "select  count(*) from member where id=? and email=?";
		int pw = jdbcTemplate.queryForObject(sql, Integer.class, id, email);
		return pw > 0;

	}

	// 임시 비밀번호 설정
	public boolean temp(String id) {
		String tempPw = StringUtil.createRandomString(10);

		String sql = "update member set pw=? where id=?";
		Object[] args = { tempPw, id };

		return jdbcTemplate.update(sql, args) > 0;
	}

	@Override
	public boolean delete(String id, String pw) {
		String sql = "delete member where id=? and pw=?";
		Object[] args = { id, pw };

		return jdbcTemplate.update(sql, args) > 0;
	}

	@Override
	public Member profile(String id) {
		String sql = "select * from member where id=?";
		Object[] args = { id };
		return jdbcTemplate.query(sql, args, extractor);
	}

	@Override
	public boolean edit(Member m) {
		String sql = "update member set pw=?, phone=?, email=?, addr1=?,addr2=?,addr3=? where id=?";
		Object[] args = { m.getPw(), m.getPhone(), m.getEmail(), m.getAddr1(), m.getAddr2(), m.getAddr3(), m.getId() };
		return jdbcTemplate.update(sql, args) > 0;
	}

}
