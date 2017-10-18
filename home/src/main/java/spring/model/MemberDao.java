package spring.model;

import org.springframework.stereotype.Repository;

import spring.bean.Member;

@Repository
public interface MemberDao {
//	List<Member> getList();
	boolean login(Member m);
	boolean join(Member m);
}