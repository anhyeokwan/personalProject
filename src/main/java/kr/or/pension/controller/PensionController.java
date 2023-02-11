package kr.or.pension.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.common.Filename;
import kr.or.pension.model.service.PensionService;
import kr.or.pension.model.vo.Pension;
import kr.or.pension.model.vo.PensionFile;

@Controller
public class PensionController {
	@Autowired
	private PensionService service;
	
	@Autowired
	private Filename filename;
	
	@RequestMapping(value="/goPensionRegistFrm.do")
	public String goPensionRegistFrm() {
		return "pension/pensionRegistFrm";
	}
	
	@RequestMapping(value = "/insertPension.do")
	public String insertPension(Pension pension, MultipartFile[] pensionImg, HttpServletRequest request) {
		
		PensionFile pf = null;
		
		// pensionImg 배열이 비어있지 않다면
		if(!pensionImg[0].isEmpty()) {
			
			// 파일이 저장될 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/pension/");
			
			for(MultipartFile files : pensionImg) {
				// 파일의 오리지널 이름
				String fileRename = files.getOriginalFilename();
				
				// 파일이 중보되었을때 새로 부여될 이름
				String filepath = filename.fileRename(savePath, fileRename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				pf = new PensionFile();
				pf.setFilename(fileRename);
				pf.setFilepath(filepath);
				
			}
			
		}
		pension.setPensionImg(pf.getFilepath());
		int result = service.insertPension(pension);
		
		return "redirect:/";
	}
}


























