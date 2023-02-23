package kr.or.cpi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.cpi.model.service.CpiService;

@Controller
public class CpiController {
	
	@Autowired
	private CpiService service;
	
}
