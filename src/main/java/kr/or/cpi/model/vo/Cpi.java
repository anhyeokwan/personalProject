package kr.or.cpi.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cpi {
	private String statsYr;
	private String srvInstId;
	private String srvCd;
	private int srcNt;
}
