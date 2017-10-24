package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.ReplyBoard;

@Repository
public interface ReplyBoardDao {
	void insert(ReplyBoard rboard);
	List<ReplyBoard> list(int parent);
	boolean delete(int no, String writer);
}
