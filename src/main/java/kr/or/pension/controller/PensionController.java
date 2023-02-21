package kr.or.pension.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.common.Filename;
import kr.or.pension.model.service.PensionService;
import kr.or.pension.model.vo.Pension;
import kr.or.pension.model.vo.PensionFile;
import kr.or.pension.model.vo.Practice;

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
	
	@ResponseBody
	@RequestMapping(value = "/insertPension.do", produces = "application/json;charset=utf-8")
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
		
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping(value = "/practice.do")
	public String insertPracticeFrm() {
		return "pension/insertPracticeFrm";
	}
	
	@RequestMapping(value = "/insertPractice.do")
	public String insertPractice(Practice practice) {
		int result = service.insertPractice(practice);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/practiceList.do")
	public String practiceList(int reqPage, Model model) {
		HashMap<String, Object> map = service.selectAllPractice(reqPage);
		
		model.addAttribute("list", map.get("list"));
		return "pension/practiceList";
	}
}


























