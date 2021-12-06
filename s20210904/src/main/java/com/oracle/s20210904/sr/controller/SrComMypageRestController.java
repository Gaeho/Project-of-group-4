package com.oracle.s20210904.sr.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.s20210904.sr.service.SrComMypageService;

@RestController
public class SrComMypageRestController {
	
	@Autowired
	private SrComMypageService scms;
	
}
