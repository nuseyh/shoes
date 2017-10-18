package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
			Member m = new Member();
			m.setNo(rs.getInt("no"));
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAddr1(rs.getString("addr1"));
			m.setAddr2(rs.getString("addr2"));
			m.setAddr3(rs.getString("addr3"));
			m.setMoney(rs.getInt("money"));
			m.setPower(rs.getString("power"));
			m.setReg(rs.getString("reg"));
			return m;
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
		int result = jdbcTemplate.update(sql, m.getId(), m.getPw(), m.getName(), m.getPhone(), m.getEmail(), m.getAddr1(),m.getAddr2(), m.getAddr3());
		System.out.println(result);
		return result > 0;
	}

}
