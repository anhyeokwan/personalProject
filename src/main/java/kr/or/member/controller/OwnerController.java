package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.OwnerService;
import kr.or.member.model.vo.Owner;

@Controller
public class OwnerController {
	@Autowired
	private OwnerService service;
	
	@RequestMapping(value = "/ownerFrm.do")
	public String ownerJoinFrm() {
		return "member/ownerJoinFrm";
	}
	
	@RequestMapping(value = "/insertOwnerMember.do")
	public String insertOwnerMember(Owner owner) {
		int result = service.insertOwnerMember(owner);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/idMultipleOnwerChk.do")
	public String idMultipleOnwerChk(String idMulti, Model model) {
		Owner owner = service.idMultipleOnwerChk(idMulti);
		
		if(owner == null) {
			model.addAttribute("result", 0);
			model.addAttribute("checkId", idMulti);
		}else {
			model.addAttribute("result", 1);
			model.addAttribute("checkId", idMulti);
		}
		
		return "member/ownerCheckId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxOwnerIdCheck.do", produces = "application/json;charset=utf-8")
	public String ajaxOwnerIdCheck(String idChk) {
		Owner owner = service.idMultipleOnwerChk(idChk);
		
		if(owner == null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping(value = "/naverCallbackOwner.do")
	public String naverCallback() {
		return "member/ownerCallback";
	}
	
	@RequestMapping(value = "/insertNaverOwner.do")
	public String insertNaverOwner(Owner owner, Model model) {
		int result = service.insertNaverOwner(owner);
		
		if(result == 0) {
			model.addAttribute("msg", "이미 있는 이메일입니다.");
			return "member/ownerJoinFrm";
		}else {
			return "common/license";
		}
	}
}























