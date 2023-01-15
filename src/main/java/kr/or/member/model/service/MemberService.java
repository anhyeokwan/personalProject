package kr.or.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.Owner;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectIdCheck(String memberId) {
		
		// 일반회원 객체
		Member member = dao.selectIdCheck(memberId);
		
		if(member == null) {
			return null;
		}else {
			return member;
		}
	}
	
	@Transactional
	public int joinMember(Member member) {
		int result = dao.joinMember(member);
		return result;
	}
	
	@Transactional
	public Member loginMember(Member member) {
		Member m = dao.loginMember(member);
		return m;
	}

	public int insertNaver(Member member) {
		Member m = dao.selectOneMember(member);
		return 0;
	}
}





















