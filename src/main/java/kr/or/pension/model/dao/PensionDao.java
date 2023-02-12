package kr.or.pension.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.pension.model.vo.Pension;
import kr.or.pension.model.vo.Practice;

@Repository
public class PensionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPension(Pension pension) {
		int result = sqlSession.insert("pension.insertPension", pension);
		return result;
	}

	public int insertPractice(Practice practice) {
		int result = sqlSession.insert("pension.insertPractice", practice);
		return result;
	}

	public ArrayList<Practice> selectAllPractice() {
		List list = sqlSession.selectList("pension.selectAllPractice");
		return (ArrayList<Practice>)list;
	}
}



















