package kr.or.pension.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pension.model.dao.PensionDao;

@Service
public class PensionService {
	@Autowired
	public PensionDao dao;
}
