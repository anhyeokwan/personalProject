package kr.or.common;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class Filename {
	
	public String fileRename(String filepath, String filename) {
		
		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); // 파일이름 0번째부터 .까지 자르는 오직 파일이름만 가져옴
		String extension = filename.substring(filename.lastIndexOf(".")); // 파일이름의 .부터 끝까지 확장자를 가져옴
		
		String path = null;
		
		int count = 0;
		while(true) {
			if(count == 0) {
				// 파일이 중복이 아닐때
				path = onlyFilename + extension;
			}else {
				path = onlyFilename + extension + "(" + count + ")";
			}
			File checkFile = new File(filepath + path);
			if(!checkFile.exists()) {
				// 파일이 중복이 아닐때
				break;
			}
		}
		
		return path;
	}

}
