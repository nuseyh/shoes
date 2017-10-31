package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Board;

@Repository(value = "boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Board> mapper = (rs, index) -> {
		return new Board(rs);
	};
	
	private ResultSetExtractor<Board> extractor = (rs)->{
		return rs.next()?new Board(rs):null;
	};
	
	// 게시글 쓰기
	@Override
	public int insert(Board board) {
		String sql = "select sp_board_seq.nextval from dual";
		int no = jdbcTemplate.queryForObject(sql, Integer.class);
		
		// 새글인지 답글인지에 따라 달라지는 항목들이 존재한다
		// [새글] gno를 no로 설정, parent = 0, depth = 0
		// [답글] gno를 넘어온 값으로 설정, parent는 넘어온 값, depth는 넘어온 값 + 1
		int gno, parent, depth;
		if (board.getGno() == 0) {// 새글이면
			gno = no;
			parent = 0;
			depth = 0;
		} else {// 답글이면
			gno = board.getGno();
			parent = board.getParent();
			depth = board.getDepth() + 1;
		}

		sql = "insert into sp_board values(?, ?, ?, ?, ?, ?, sysdate, 0, ?, ?, ?, ?)";
		Object[] obj = {no, "expected", board.getTitle(), board.getWriter(), board.getDetail(),
							board.getPw(), gno, parent, depth, board.getNotice()};
		jdbcTemplate.update(sql, obj);
		return no;
	}


	// 게시글 리스트
	@Override
	public List<Board> list(int start, int end) {
		String sql = "select * from (" + "select rownum as rn, A.* from (" + "select * from sp_board " 
				+ "start with parent=0 " 
				+ "connect by prior no=parent "
				+ "order siblings by gno desc, no asc" 
				+ ")A" + ") where rn between ? and ?";
		Object[] obj = { start, end };
		return jdbcTemplate.query(sql, obj, mapper);
	}

	// 게시글 검색
	@Override
	public List<Board> search(String type, String key, int start, int end) {
		String sql = "select * from (" + "select rownum as rn, A.* from (" + "select * from sp_board where " + type
				+ " like '%'||?||'%' order by no desc" + ")A" + ") where rn between ? and ?";
		Object[] obj = { key, start, end };
		return jdbcTemplate.query(sql, obj, mapper);
	}
	
	//게시글 상세보기 
	@Override
	public Board detail(int no) {
		String sql = "select * from sp_board where no=?";
		Object[] obj = {no};
		return jdbcTemplate.query(sql, obj, extractor);
	}


	//게시글 수정
	@Override
	public void edit(Board board, String detail, String pw) {
		String sql = "update sp_board set detail=?, pw=? where no=?";
		Object[] obj = {detail, pw, board.getNo() };
		jdbcTemplate.update(sql, obj);
	}
	
	//게시글 삭제, 수정, 열람 시 비밀번호
	@Override
	public boolean password(Board board) {
		String sql = "select * from sp_board where no=? and pw=?";
		Object[] obj = {board.getNo(), board.getPw()};
		return jdbcTemplate.query(sql, obj, mapper) != null;
	}
	
	//게시글 삭제 
	@Override
	public void delete(int no) {
		String sql = "delete sp_board where no=?";
		Object[] obj = {no};
		jdbcTemplate.update(sql, obj);
	}

	//조회수 증가 
	@Override
	public void plusRead(int no) {
		String sql = "update sp_board set read=read+1 where no=?";
		jdbcTemplate.update(sql, no);
	}

	//게시글 수를 파악하는 
	@Override
	public int getBoardCount() {
		String sql = "select count(*) from sp_board";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	@Override
	public int getBoardCount(String type, String key) {
		String sql = "select count(*) from sp_board where ? like '%'||?||'%'";
		Object[] obj = { type, key };
		return jdbcTemplate.queryForObject(sql, obj, Integer.class);
	}

	//답글이 달릴시 게시글의 답변 유무 변경
	@Override
	public void changeState(int parent, String state) {
		String sql = "update sp_board set state=? where no=?";
		Object[] obj = {state, parent};
		jdbcTemplate.update(sql, obj);
	}


	

	

}
