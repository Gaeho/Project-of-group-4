package com.oracle.s20210904.sy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 로그인 확인
	private String idCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");

		return id;
	}
	
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
	public String PostInsertView(HttpServletRequest request, Model model) throws Exception {
    	System.out.println("SyPostController postInsert GET");
//    	String returnString = null;
//    	String sessionCheck = "sessionNone";
    	String userId=idCheck(request);
		System.out.println("Session Check : "+userId);
		
/*		if(userId.equals(sessionCheck)) {
			System.out.println("redirect:/main");
			return "redirect:/main";
		} else if(userId != null) {
			
			returnString = "sy/postInsert";
		} */
    	
		return "sy/postInsert";
	}
    
    // 게시글 작성 처리
	@RequestMapping(value = "postInsert", method = RequestMethod.POST)
	@ResponseBody
	public String postInsert(Post post, HttpServletRequest request, Model model, RedirectAttributes redirect) throws Exception {
		System.out.println("SyPostController postInsert POST");
		String userId=idCheck(request);
		model.addAttribute("userId", userId);
		post.setUser_id(userId);
	    System.out.println("SyPostController postInsert post getPost_title->"+post.getPost_title());	
	    System.out.println("SyPostController postInsert post getBrd_code->"+post.getBrd_code());	
	    System.out.println("SyPostController postInsert post getPost_ctx->"+post.getPost_ctx());
	    System.out.println("SyPostController postInsert post getPost_regdate->"+post.getPost_regdate());
	    System.out.println("SyPostController postInsert post getUser_id->"+post.getUser_id());	
	    System.out.println("SyPostController postInsert post getPost_code->"+post.getPost_code());	
		
		syPostServiceImpl.postInsert(post);
		
		/* redirect.addFlashAttribute("msg", "InsertSuccess"); */

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
	public String getPostUpdate(HttpServletRequest request, Model model, @RequestParam("post_code") int post_code) throws Exception {
		String userId=idCheck(request);
		model.addAttribute("userId", userId);
	    System.out.println("SyPostController postUpdate GET getPost_title : "+post_code);
		logger.info("getpostUpdate GET");
		model.addAttribute("post", syPostServiceImpl.postView(post_code));
		
		return "sy/postUpdate";
	}
	
	// 게시글 수정 처리
	@RequestMapping(value = "postUpdate", method = RequestMethod.POST)
	public String postUpdate(HttpServletRequest request, Model model, Post post, RedirectAttributes redirect) throws Exception {
		String userId=idCheck(request);
		model.addAttribute("userId", userId);
	    System.out.println("SyPostController postUpdate POST getPost_title : "+post.getPost_title());	
	    System.out.println("SyPostController postUpdate POST getPost_ctx : "+post.getPost_ctx());	
	    System.out.println("SyPostController postUpdate POST getUser_id : "+post.getUser_id());	
	    System.out.println("SyPostController postUpdate POST getPost_code : "+post.getPost_code());	
		logger.info("postUpdate POST");
		int updateResult = syPostServiceImpl.postUpdate(post);	
		//redirect.addFlashAttribute("message", "UpdateSuccess");

		return "redirect:postList";
	}
	
	// 게시글 삭제 처리
	@RequestMapping(value = "postDelete")
	public String postDelete(@RequestParam int post_code) throws Exception {
	    System.out.println("SyPostController postDelete getPost_code : "+post_code);	
		syPostServiceImpl.postDelete(post_code);
		logger.info("postDelete START");
//		redirect.addFlashAttribute("message", "DeleteSuccess");

		return "redirect:postList";
	}

	@RequestMapping(value = "postReply", method = RequestMethod.GET)
	public String postViewReply (HttpServletRequest request, Model model, @RequestParam("post_code") int post_code) throws Exception {
		logger.info("postViewReply START");
		
		model.addAttribute("postViewReply", syPostServiceImpl.postViewReply(post_code));
				
		return "sy/postReply";
	}
	
	@RequestMapping(value = "postReply", method = RequestMethod.POST)
	@ResponseBody
	public String postReply(Post post, HttpServletRequest request, Model model, RedirectAttributes redirect) throws Exception {
		System.out.println("SyPostController postReply POST");
		String userId=idCheck(request);
		model.addAttribute("userId", userId);
		post.setUser_id(userId);
	    System.out.println("SyPostController postReply post getPost_code->"+post.getPost_code());
	    System.out.println("SyPostController postReply post getBrd_code->"+post.getBrd_code());
	    System.out.println("SyPostController postReply post getPost_title->"+post.getPost_title());	
	    System.out.println("SyPostController postReply post getPost_ctx->"+post.getPost_ctx());
	    System.out.println("SyPostController postReply post getPost_regdate->"+post.getPost_regdate());
	    System.out.println("SyPostController postReply post getUser_id->"+post.getUser_id());		
	    System.out.println("SyPostController postReply post getPost_code->"+post.getRef());	
	    System.out.println("SyPostController postReply post getPost_code->"+post.getRef_step());	
	    System.out.println("SyPostController postReply post getPost_code->"+post.getRef_lev());	
		
		syPostServiceImpl.postReply(post);

		return "redirect:postList";
	}
	 
}
