package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Owner {
	private int ownerNo;
	private String ownerId;
	private String ownerPw;
	private String ownerName;
	private String ownerPhone;
	private String ownerEamil;
	private String ownerType;
	private String businessLicenseNo;
}
