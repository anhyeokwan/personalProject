package kr.or.pension.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pension {
	private int pensionNo;
	private int ownerNo;
	private String pensionName;
	private String pensionAddr;
	private String pensionSerivce;
	private int roomCnt;
	private String pensionImg;
	private String businessLicenseNo;
}
