package com.oracle.s20210904.sy.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.dj.controller.DjSearchController;
import com.oracle.s20210904.sy.model.SySearch;
import com.oracle.s20210904.sy.service.SySearchService;

@Controller
public class SySearchController {
	private static final Logger logger = LoggerFactory.getLogger(DjSearchController.class);
	
	@Autowired
	private SySearchService sySearchServiceImpl;
	
	@PostMapping(value = "postSearch")
	public String searchPost(SySearch sySearch, String currentPage, Post post, Model model, String post_search) {
		System.out.println("SySearchController searchPost START");
		System.out.println("SySearchController searchPost : "+post_search);
		
		String searchPost1 = post_search.replaceAll("\\s+","");
		
		System.out.println("SySearchController searchPost : "+searchPost1);
		
		sySearch.setPost_search(searchPost1);
		sySearch.setStart(1);
		sySearch.setEnd(10);
		
		List<SySearch> result = sySearchServiceImpl.searchPost(sySearch);
		model.addAttribute("postResult", result);
		model.addAttribute("searchPost1", searchPost1);
		
		if(currentPage == null) {
			currentPage = "1";
		}
		
		int total = result.size();
		System.out.println("result.size Result : "+total);
		
		Paging paging = new Paging(total, currentPage);
		
		
		model.addAttribute("paging", paging);
		
		System.out.println("Paging START");
		System.out.println(""+paging.getCurrentPage());
		System.out.println(""+paging.getEnd());
		System.out.println(""+paging.getEndPage());
		System.out.println(""+paging.getPageBlock());
		System.out.println(""+paging.getRowPage());
		System.out.println(""+paging.getStart());
		System.out.println(""+paging.getStartPage());
		System.out.println(""+paging.getTotal());
		System.out.println(""+paging.getTotalPage());
		System.out.println("Paging END");		
		
		Paging paging1 = new Paging(total, currentPage);
		model.addAttribute("paging1", paging1);
		
		return "sy/postSearch";
		
	}
}
