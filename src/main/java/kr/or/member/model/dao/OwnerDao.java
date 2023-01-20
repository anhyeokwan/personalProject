package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Owner;

@Repository
public class OwnerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertOwnerMember(Owner owner) {
		int result = sqlSession.insert("member.insertOwnerMember", owner);
		return result;
	}

	public Owner selectOwnerIdCheck(String memberId) {
		Owner owner = sqlSession.selectOne("member.selectOwnerMember", memberId);
		
		if(owner == null) {
			return null;
		}else {
			return owner;
		}
		
	}

	public ArrayList<Owner> selectOwnerList(Owner owner) {
		List list = sqlSession.selectList("member.selectOwnerList", owner);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Owner>)list;
		}
		
	}

	public int insertNaverOwner(Owner owner) {
		int result = sqlSession.insert("member.insertNaverOwner", owner);
		return result;
	}
}




















