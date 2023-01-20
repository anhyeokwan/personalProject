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
		Member member = service.selectIdCheck(idMulti);
		
		if(member == null) {
			model.addAttribute("result", 0);
			model.addAttribute("checkId", idMulti);
			
		}else {
			model.addAttribute("result", 0);
			model.addAttribute("checkId", idMulti);
			model.addAttribute("member", member);
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
		Member map = service.selectIdCheck(idChk);
		
		if(map == null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping(value = "naverCallback.do")
	public String naverCallback() {
		return "member/naverCallback";
	}
	
	@RequestMapping(value = "/naverCallback2.do")
	public String naverCallback2() {
		return "member/naverCallback2";
	}
	
	@RequestMapping(value = "/naverJoin.do")
	public String naverJoin(Member member, Model model) {
		int result = service.insertNaver(member);
		
		if(result == 0) {
			model.addAttribute("msg", "이미 있는 이메일입니다.");
			return "member/memberJoin";
		}else {
			System.out.println("네이버 회원가입 성공!!");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/naverLogin.do")
	public String naverLogin(Member member, HttpSession session, Model model) {
		Member m = service.selectNaverLogin(member);
		
		if(m == null) {
			model.addAttribute("msg", "일반회원 또는 카카오 이메일이 있는지 확인하세요");
			return "member/loginFrm";
		}else {
			session.setAttribute("member", m);
			return "redirect:/";
		}
	}
}
























