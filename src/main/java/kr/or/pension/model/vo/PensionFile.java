package kr.or.pension.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PensionFile {
	private int fileNo;
	private int pensionNo;
	private String filename;
	private String filepath;
}
