package kr.or.cpi.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cpi.model.dao.CpiDao;

@Service
public class CpiService {

	@Autowired
	private CpiDao dao;
}
