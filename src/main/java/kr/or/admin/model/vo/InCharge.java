package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InCharge {

	private int icIdx;
	private String company;
	private String icName;
	private String phone;
	private String mobile;
	private String email;
	private String regDate;
	private String modDate;
	private char status;
	private String position;
	private char mainChk;
	private int cIdx; // 고객사 일련번호
	
}
