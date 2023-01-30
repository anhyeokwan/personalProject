package kr.or.pension.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pension.model.service.PensionService;

@Controller
public class PensionController {
	@Autowired
	private PensionService service;
	
	@RequestMapping(value="/goPensionRegistFrm.do")
	public String goPensionRegistFrm() {
		return "pension/pensionRegistFrm";
	}
}
