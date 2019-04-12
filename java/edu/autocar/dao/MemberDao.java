package edu.autocar.dao;

import edu.autocar.domain.Member;

public interface MemberDao extends CrudDao<Member, String> {
	int updateByAdmin(Member member) throws Exception;
}
