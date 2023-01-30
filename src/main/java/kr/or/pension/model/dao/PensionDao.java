package kr.or.pension.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PensionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
