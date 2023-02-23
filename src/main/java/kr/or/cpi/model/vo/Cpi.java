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
	private int jiacen1;
	private int jiacen2;
	private int jiacen3;
	private int jiacen4;
	private int jiacen5;
}
