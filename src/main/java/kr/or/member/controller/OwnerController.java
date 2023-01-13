package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.OwnerService;

@Controller
public class OwnerController {
	@Autowired
	private OwnerService service;
	
	@RequestMapping(value = "/ownerFrm.do")
	public String ownerJoinFrm() {
		return "member/ownerJoinFrm";
	}
}
