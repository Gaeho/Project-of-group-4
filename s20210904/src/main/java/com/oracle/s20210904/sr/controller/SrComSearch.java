package com.oracle.s20210904.sr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.service.SrComMypageService;

@Controller
public class SrComSearch {
	
	@Autowired
	private SrComMypageService scms;
	
	// 회원검색
	@GetMapping(value = "ComMemberSearch")
	public String ComMemberSearch(Model model, String currentPage, CommMemResume commMemResume, CommCompany commCompany,
			String searchKeyword, String searchType, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		Map<String , Object> getForPrintResumeByParam=new HashMap();
		getForPrintResumeByParam.put("searchKeyword", searchKeyword);
		getForPrintResumeByParam.put("searchType", searchType);
		
		List<CommMemResume> commMemResumes=scms.getForPrintResumeByParam(getForPrintResumeByParam);
		
		System.out.println("SrComMypageController ComMemberSearch START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		commMemResume.setStart(pg.getStart()); // 1
		commMemResume.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// commMemResume list
		List<CommMemResume> commMemResumeList=scms.commMemResumeList(commMemResume);
		
		model.addAttribute("commMemResumes", commMemResumes);
		for(CommMemResume aa1: commMemResumes) {
			System.out.println("SrComMypageController commMemResume.getUser_id->" +aa1.getUser_id());
			System.out.println("SrComMypageController commMemResume.getComm_ctx()->" +aa1.getComm_ctx());
		}
		model.addAttribute("commCompany1", commCompany1);
		
		
		return "sr/comMemberSearchMenu";
	}
}
