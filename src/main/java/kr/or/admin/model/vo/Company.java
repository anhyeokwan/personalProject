package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Company {

	private int cIdx;
	private String company;
	private String cName;
	private String status;
//	private String phone;
//	private String mobile;
	private String regDate;
	private String modDate;
	private String regId;
	private String modId;
	private String bank;
	private String accNum;
	private String etc;
	
}
