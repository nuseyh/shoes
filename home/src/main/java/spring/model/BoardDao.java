package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Board;

@Repository
public interface BoardDao {
	int insert(Board board);

	List<Board> list(int start, int end);

	List<Board> search(String type, String key, int start, int end);
	
	Board detail(int no);
	
	boolean password(Board board);
	
	void delete(int no);
	
	void edit(Board board, String detail, String pw);
	
	void plusRead(int no);

	int getBoardCount();
	int getBoardCount(String type, String key);


}
