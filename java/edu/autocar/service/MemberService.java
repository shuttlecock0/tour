package edu.autocar.service;

import org.springframework.web.multipart.MultipartFile;

import edu.autocar.domain.Member;
import edu.autocar.domain.PageInfo;

public interface MemberService {
	PageInfo<Member> getPage(int page) throws Exception;
	Member getMember(String userId) throws Exception;
	void create(Member member, MultipartFile file) throws Exception;
	boolean update(Member member, MultipartFile file) throws Exception;
	boolean updateByAdmin(Member member, MultipartFile file) throws Exception;
	
	//관리자만 삭제 가능 - 비밀번호는 관리자의 비밀번호
	boolean delete(String userId, String password) throws Exception;
	Member checkPassword(String userId, String password) throws Exception;
	
}
