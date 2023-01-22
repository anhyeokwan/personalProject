package kr.or.member.model.service;

import java.util.ArrayList;

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

	public Owner idMultipleOnwerChk(String idMulti) {
		Owner owner = dao.selectOwnerIdCheck(idMulti);

		if(owner == null) {
			return null;
		}else {
			return owner;
		}
	}

	public int insertNaverOwner(Owner owner) {
		ArrayList<Owner> list = dao.selectOwnerList(owner);
		int result = 0;
		
		if(list == null) {
			result = dao.insertNaverOwner(owner);
			return result;
		}else {
			return 0;
		}
		
	}
	
	public Owner selectOwnerMember(Owner owner) {
		Owner o = dao.selectOwnerMember(owner);
		
		if(o == null) {
			return null;
		}else {
			return o;
		}
		
	}
}

























