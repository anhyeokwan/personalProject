package kr.or.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.OwnerDao;

@Service
public class OwnerService {
	@Autowired
	private OwnerDao dao;
}
