package kr.or.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectIdCheck(String memberId) {
		Member member = dao.selectIdCheck(memberId);
		if(member == null) {
			return null;
		}else {
			return member;
		}
	}

	public int joinMember(Member member) {
		int result = dao.joinMember(member);
		return result;
	}
}
