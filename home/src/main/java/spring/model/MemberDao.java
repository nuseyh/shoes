package spring.model;


import org.springframework.stereotype.Repository;

import spring.bean.Member;


@Repository
public interface MemberDao {
	// List<Member> getList();
	boolean login(Member m);

	boolean join(Member m);
	
	boolean temp(String id);

	String idsearch(String name, String email);
	
	boolean pwsearch(String id, String email);

	Member profile(String id);

	boolean delete(String id, String pw);

	boolean edit(Member m);


}