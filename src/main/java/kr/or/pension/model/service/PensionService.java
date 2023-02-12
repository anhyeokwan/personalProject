package kr.or.pension.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pension.model.dao.PensionDao;
import kr.or.pension.model.vo.Pension;
import kr.or.pension.model.vo.Practice;

@Service
public class PensionService {
	@Autowired
	public PensionDao dao;

	public int insertPension(Pension pension) {
		int result = dao.insertPension(pension);
		return result;
	}

	public int insertPractice(Practice practice) {
		int result = dao.insertPractice(practice);
		return result;
	}

	public HashMap<String, Object> selectAllPractice(int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Practice> list = dao.selectAllPractice();
		map.put("list", list);
		return map;
	}
}



























