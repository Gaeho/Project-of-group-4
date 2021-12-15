package com.oracle.s20210904.sy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.sy.model.PostSearch;
import com.oracle.s20210904.sy.service.SyPostService;

@Controller
public class SyPostController {

	private static final Logger logger = LoggerFactory.getLogger(SyPostController.class);

	@Autowired
	private SyPostService syPostServiceImpl;
	
	// 게시글 목록
	@RequestMapping(value = "postList", method = RequestMethod.GET)
	public String postSelect(Post post, Model model
			, @RequestParam(required = false, defaultValue = "5") int total
			, @RequestParam(required = false, defaultValue = "1") String currentPage
			, @RequestParam(required = false, defaultValue = "post_title") String searchType
			, @RequestParam(required = false) String keyword
				) throws Exception {
		
		logger.info("postList");
		
		Paging paging = new Paging(total, currentPage);
		post.setStart(paging.getStart());
		post.setEnd(paging.getEnd());
		
		PostSearch postSearch = new PostSearch(total, keyword);
		postSearch.setSearchType(searchType);
		postSearch.setKeyword(keyword);
		
		List<Post> totalCount = syPostServiceImpl.total(postSearch);
		
		postSearch.paging(total, currentPage);
		
		List<Post> postSelect = syPostServiceImpl.postSelect(postSearch);

		model.addAttribute("total", total);
		model.addAttribute("postSelect", postSelect);
		model.addAttribute("paging", paging);

		return "sy/postList";
	}
	
	// 게시글 작성 페이지 이동
    @RequestMapping(value= "postInsert", method = RequestMethod.GET)
	public String getPostInsert() throws Exception {
    	
    	logger.info("postInsert GET");
    	
		return "sy/postInsert";
	}
    
    // 게시글 작성 처리
	@RequestMapping(value = "postInsert", method = RequestMethod.POST)
	public String postInsert(Post post, RedirectAttributes redirect) throws Exception {
		
		logger.info("postInsert POST");

		syPostServiceImpl.postInsert(post);

		redirect.addFlashAttribute("result", "InsertSuccess");

		return "redirect:postList";
	}
	
	// 게시글 조회
	@RequestMapping(value= "postView", method = RequestMethod.GET)
	public String postView(Model model, @RequestParam("post_code") int post_code) throws Exception {
		
		logger.info("postView");
			
		model.addAttribute("postView", syPostServiceImpl.postView(post_code));
		
		return "sy/postView";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping(value = "postUpdate", method = RequestMethod.GET)
	public String getPostUpdate(Model model, @RequestParam("post_code") int post_code) throws Exception {
		logger.info("postUpdate GET");
		
		model.addAttribute("postUpdate", syPostServiceImpl.postView(post_code));
		
		return "sy/postUpdate";
	}
	
	// 게시글 수정 처리
	@RequestMapping(value = "postUpdate", method = RequestMethod.POST)
	public String postUpdate(Post post, RedirectAttributes redirect) throws Exception {
		logger.info("postUpdate POST");
		
		syPostServiceImpl.postUpdate(post);
		
		redirect.addFlashAttribute("result", "UpdateSuccess");

		return "redirect:postList";
	}
	
	// 게시글 삭제 처리
	@RequestMapping(value = "postDelete", method = RequestMethod.POST)
	public String postDelete(RedirectAttributes redirect, @RequestParam("user_id") String user_id) throws Exception {
		
		logger.info("postDelete");
		
		syPostServiceImpl.postDelete(user_id);

		redirect.addFlashAttribute("result", "DeleteSuccess");

		return "redirect:postList";
	}

	@RequestMapping("postReply")
	public String postReplyView (HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
				
		return "sy/postReply";
	}
	
	@RequestMapping("/reply")
	public String postReply(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		
		return "redirect:postList";
	}
	 
}
