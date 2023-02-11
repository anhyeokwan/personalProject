package kr.or.pension.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.pension.model.vo.Pension;

@Repository
public class PensionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPension(Pension pension) {
		int result = sqlSession.insert("pension.insertPension", pension);
		return result;
	}
}
