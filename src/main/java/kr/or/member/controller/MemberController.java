package kr.or.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.common.MailSend;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.Owner;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private MailSend mailSend;
	
	@RequestMapping(value="/signFrm.do")
	public String signFrm() {
		return "member/signUpFrm";
	}
	
	@RequestMapping(value="/memberjoinFrm.do")
	public String memberJoin() {
		return "member/memberJoin";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mailSend.do", produces = "application/json;charset=utf-8")
	public String mailSend(String email) {
		String authPW = mailSend.mailSendMethod(email);
		
		Gson gson = new Gson();
		String mailAuth = gson.toJson(authPW);
		
		return mailAuth;
	}
	
	@RequestMapping(value="/idMultipleChk.do")
	public String idCheck(String idMulti, Model model) {
		HashMap<String, Object> member = service.selectIdCheck(idMulti);
		
		if(member == null) {
			model.addAttribute("result", true);
			model.addAttribute("checkId", idMulti);
			
		}else if(member.get("member") != null) {
			model.addAttribute("result", false);
			model.addAttribute("checkId", idMulti);
			model.addAttribute("member", (Member)member.get("member"));
		}else if(member.get("owner") != null) {
			model.addAttribute("result", false);
			model.addAttribute("checkId", idMulti);
			model.addAttribute("member", (Owner)member.get("owner"));
		}
		
		return "member/checkId";
		
	}
	
	@RequestMapping(value="/insertMember.do")
	public String joinMember(Member member) {
		int result = service.joinMember(member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(Member member, HttpSession session, Model model) {
		Member m = service.loginMember(member);
		
		if(m != null) {
			session.setAttribute("member", m);
			return "redirect:/";
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			return "member/loginFrm";
		}
		
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxIdCheck.do", produces = "application/json;charset=utf-8")
	public String ajaxIdCheck(String idChk) {
		HashMap<String, Object> map = service.selectIdCheck(idChk);
		
		if(map == null) {
			return "1";
		}else if(map.get("member") != null) {
			return "0";
		}else {
			return "0-1";
		}
	}
}
























