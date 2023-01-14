package kr.or.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.OwnerDao;
import kr.or.member.model.vo.Owner;

@Service
public class OwnerService {
	@Autowired
	private OwnerDao dao;
	
	@Transactional
	public int insertOwnerMember(Owner owner) {
		int result = dao.insertOwnerMember(owner);
		return result;
	}
}
