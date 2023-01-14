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

	public HashMap<String, Object> selectIdCheck(String memberId) {
		
		// return할 hashmap
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 일반회원 객체
		Member member = dao.selectIdCheck(memberId);
		System.out.println(member);
		// 팬션 사장짐 조회
		Owner owner = dao.selectOwnerIdCheck(memberId);
		System.out.println(owner);
		map.put("member", member);
		map.put("owner", owner);
		
		if(member == null && owner == null) {
			return null;
		}else {
			return map;
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
}
