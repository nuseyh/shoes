package spring.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.Member;


@Repository
public interface AdminDao {
	// 관리자 기능
	List<Member> list();
	public List<Member> search(String key);
}
