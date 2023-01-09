package kr.or.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Util {

	public String encData(String memberPw)throws Exception {
		
		// MessageDigest 클래스를 이용한 암호화
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		
		// memberPw에 들어있는 값을 바이트배열로 변혼해서 mDigest객체에 넣어줌
		mDigest.update(memberPw.getBytes());
		
		byte[] msgStr = mDigest.digest();
		
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < msgStr.length; i++) {
			byte str = msgStr[i];
			String encData = Integer.toString((str & 0xff) + 0x100, 16).substring(1);
			sb.append(encData);
		}
		
		return sb.toString();
	}
	
}
