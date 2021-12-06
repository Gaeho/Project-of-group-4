package com.oracle.s20210904.comm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	

	@RequestMapping("/main")
	public String mainStart(Model model) {
		System.out.println("메인 시작");
		
		return "Main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
