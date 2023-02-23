package kr.or.cpi.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cpi.model.vo.Cpi;

@Repository
public class CpiDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Cpi selectOneJiacen(HashMap<String, Object> params) {
		
		Cpi cpiOne = sqlSession.selectOne("cpiMapper.selectOneJiacen", params);
		
		return cpiOne;
	}

	public int insertJiacen(HashMap<String, Object> params) {
		System.out.println("params dao : " + params);
		return 0;
	}
	
}
