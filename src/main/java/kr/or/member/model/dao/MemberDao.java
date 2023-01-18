package kr.or.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.Owner;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectIdCheck(String memberId) {
		Member member = sqlSession.selectOne("member.selectIdCheck", memberId);
		if(member == null) {
			return null;
		}else {
			return member;
		}
	}

	public int joinMember(Member member) {
		int result = sqlSession.insert("member.joinMember", member);
		return result;
	}

	public Member loginMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember", member);
		return m;
	}

	public Member selectNaverMember(String string) {
		Member m = sqlSession.selectOne("member.selectNaverMember", string);
		
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}

	public int insertNaver(Member member) {
		int result = sqlSession.insert("member.insertNamber", member);
		return result;
	}

	
}














