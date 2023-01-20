package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

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
	
	// 해당 이메일이 있는지 조회하는 코드
	public ArrayList<Member> selectNaverMember(String string) {
		List m = sqlSession.selectList("member.selectNaverMember", string);
		
		if(m.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Member>)m;
		}
	}
	
	// 이메일이 없다면 insert를 하는 코드
	public int insertNaver(Member member) {
		int result = sqlSession.insert("member.insertNamber", member);
		return result;
	}

	public Member selectNaverLogin(Member member) {
		Member m = sqlSession.selectOne("member.selectNaverLogin", member);
		return m;
	}

	
}














