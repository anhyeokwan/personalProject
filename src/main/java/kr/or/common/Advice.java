package kr.or.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.Owner;

@Component
@Aspect
public class Advice {
	
	@Autowired
	private SHA256Util encData;
	
	@Pointcut(value="execution(* kr.or.member.model.service.MemberService.*Member(..))")
	public void shaPointcut() {}
	
	@Pointcut(value="execution(* kr.or.member.model.service.OwnerService.*Member(..))")
	public void ownerInsertPointcut() {}
	
	@Before(value="shaPointcut()")
	public void passwordEnc(JoinPoint jp) throws Exception {
		Object[] obj = jp.getArgs();
		Member member = (Member)obj[0];
		
		String memberPw = member.getMemberPw();
		if(memberPw != null) {
			String enc = encData.encData(memberPw);
			member.setMemberPw(enc);
			
		}
	}
	
	@Before(value="ownerInsertPointcut()")
	public void ownerPasswordEnc(JoinPoint jp) throws Exception{
		Object[] obj = jp.getArgs();
		Owner owner = (Owner)obj[0];
		
		String ownerPassword = owner.getOwnerPw();
		if(ownerPassword != null) {
			String encPassword = encData.encData(ownerPassword);
			owner.setOwnerPw(encPassword);
		}
	}
	
}


















