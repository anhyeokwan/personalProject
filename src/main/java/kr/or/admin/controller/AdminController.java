package kr.or.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/adminPage.do")
	public String adminPage(int reqPage) {
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/addMember.do")
	public String addMemberPage() {
		return "admin/addMemberPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertAddAdmin.do", produces = "application/json;charset=utf-8")
	public String insertAddAdmin(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("대분류 : " + map.get("lCategory"));
		System.out.println("서비스 : " + map.get("sCategory"));
		System.out.println("서비스ID : " + map.get("svcId"));
		System.out.println("서비스PW : " + map.get("svcPw"));
		System.out.println("사용여부 : " + map.get("userChk"));
		
		return null;
	}

}
