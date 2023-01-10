package kr.or.member.controller;

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
	public String mailSend(String memberEmail) {
		String authPW = mailSend.mailSendMethod(memberEmail);
		
		Gson gson = new Gson();
		String mailAuth = gson.toJson(authPW);
		
		return mailAuth;
	}
	
	@RequestMapping(value="/idMultipleChk.do")
	public String idCheck(String idMulti, Model model) {
		Member member = service.selectIdCheck(idMulti);
		
		if(member == null) {
			model.addAttribute("checkId", idMulti);
			model.addAttribute("member", member);
		}else {
			model.addAttribute("member", member);
			model.addAttribute("checkId", idMulti);
			model.addAttribute("memberId", member.getMemberId());
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
	public String memberLogin(Member member, HttpSession session) {
		Member m = service.loginMember(member);
		session.setAttribute("member", m);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
























