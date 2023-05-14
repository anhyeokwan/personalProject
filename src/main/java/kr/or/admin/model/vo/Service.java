package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Service {

	private int sIdx;
	private String svcCode;
	private String svcId;
	private String svcPw;
	private String subsUser;
	private char status;
	private String subsDate;
	private String regDate;
	private String modDate;
	private String modUser;
	private String prtCode;
	private String isAgent;
	private String isApi;
	private String svChk; // 개발 운영 여부
	private int cIdx; // 고객사 번호
	
}
