package com.oracle.s20210904.comm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.NoticeApplyAnno;
import com.oracle.s20210904.ds.service.DsAdminService;

import java.util.List;


@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	DsAdminService dsAdminService;
	
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
	
	@GetMapping(value="myPage")
	public String myPage(String grade) {
		
		String result = null;
		
		if(grade.equals("member")) {
			result="redirect:mbMypage";
		}else if(grade.equals("company")) {
			result="redirect:ComInfo";
		}
		
		return result;
	}
	
	@ResponseBody
	@GetMapping(value="alramList")
	public List<NoticeApplyAnno> alramList(Model model,HttpServletRequest request,String id) {
		System.out.println("alramList Start... id="+id);
		int cnt = 0;
		String grade = (String)request.getSession().getAttribute("grade");
		
		cnt = dsAdminService.alramCnt(id);
		List<NoticeApplyAnno> alramList =dsAdminService.alramList(id);
		System.out.println("cnt = " + cnt);
		System.out.println("alramList.size() =" +alramList.size());
		model.addAttribute("alramList",alramList);
		model.addAttribute("cnt",cnt);
		return alramList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
