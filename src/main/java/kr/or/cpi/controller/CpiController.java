package kr.or.cpi.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.cpi.model.service.CpiService;
import kr.or.cpi.model.vo.Cpi;

@Controller
public class CpiController {
	
	@Autowired
	private CpiService service;
	
	@RequestMapping(value = "/jiacen.do")
	public String jiacen() {
		return "cpi/jiacenMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectJiacen.do", produces = "application/json;charset=utf-8")
	public Cpi selectJiacen(@RequestParam HashMap<String, Object> params) {
		System.out.println("params : " + params);
		
		Cpi cpiOne = service.selectJiacen(params);
		
		return cpiOne;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertJiacen.do", produces = "application/json;charset=utf-8")
	public int insertJiacen(@RequestParam HashMap<String, Object> params) {
		
		System.out.println("params : " + params);
		
		int result = service.insertJiacen(params);
		
		return 0;
	}
}

























