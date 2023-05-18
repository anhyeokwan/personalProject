package kr.or.admin.model.service;

import org.springframework.stereotype.Service;

import kr.or.admin.model.vo.Company;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Override
	public int insertCompany(kr.or.admin.model.vo.Service service) {
		
		if(service.getPrtCode().equals("1")) {
			
		}
		
		return 0;
	}

}
