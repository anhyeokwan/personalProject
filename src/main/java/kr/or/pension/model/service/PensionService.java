package kr.or.pension.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pension.model.dao.PensionDao;
import kr.or.pension.model.vo.Pension;

@Service
public class PensionService {
	@Autowired
	public PensionDao dao;

	public int insertPension(Pension pension) {
		int result  = dao.insertPension(pension);
		return result;
	}
}
