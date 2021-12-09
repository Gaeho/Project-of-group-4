package com.oracle.s20210904.comm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	 
	
	@RequestMapping("/main")
	public String mainStart(Model model, HttpServletRequest request) {
		
		String id = null;
		String grade = null;
		
		HttpSession session = request.getSession();
		String mbid = (String)session.getAttribute("mbid");
		String cmid = (String)session.getAttribute("cmid");
		
		if(mbid==null ||mbid.equals("")){
			if( cmid==null || cmid.equals("")) {
				id =null;
			}else {
				id = cmid; grade = "company";
				session.setAttribute("grade",grade);
			}
		}else {
			id = mbid; grade = "member";
			session.setAttribute("grade",grade);
		}
		 
		model.addAttribute("id",id);
		model.addAttribute("grade",grade);
		session.setAttribute("id", id);
		System.out.println("grade :" +grade);
		System.out.println("메인 시작");
		return "Main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
