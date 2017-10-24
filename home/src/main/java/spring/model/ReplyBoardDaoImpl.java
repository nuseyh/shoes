package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.ReplyBoard;

@Repository(value="rboardDao")
public class ReplyBoardDaoImpl implements ReplyBoardDao {
	
	@Autowired
	private ReplyBoardDao rbdao;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ReplyBoard> mapper = (rs, index) -> {
		return new ReplyBoard(rs);
	};

	@Override
	public void insert(ReplyBoard rboard) {
		
		//no, writer, detail, reg, parent
		String sql = "insert into sp_replyboard values(sp_replyboard_seq.nextval, ?, ?, sysdate, ?)";
		Object[] obj = {rboard.getWriter(), rboard.getDetail(), rboard.getParent()};
		jdbcTemplate.update(sql, obj);
	}

	@Override
	public List<ReplyBoard> list(int parent) {
		String sql = "select * from sp_replyboard where parent=? order by no";
		Object[] obj = {parent};
		return jdbcTemplate.query(sql, obj, mapper);
	}

	@Override
	public boolean delete(int no, String writer) {
		String sql = "delete replyboard where no=? and writer=?";
		Object[] obj = {no, writer};
		return jdbcTemplate.update(sql, obj) > 0;
	}

}
