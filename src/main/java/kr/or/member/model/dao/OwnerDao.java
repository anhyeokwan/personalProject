package kr.or.member.model.dao;

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
}
