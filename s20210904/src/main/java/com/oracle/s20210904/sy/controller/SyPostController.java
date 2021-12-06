
package com.oracle.s20210904.sy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.service.SyPostService;

@Controller
public class SyPostController {

	@Autowired
	private SyPostService syPostServiceImpl;

	
	/*
	 * public String checkPostId(HttpServletRequest request) { HttpSession session =
	 * request.getSession(); String id = (String) session.getAttribute("postId"); if
	 * (id == null || id.equals("")) { return "/main.do"; } return id; }
	 */
	 

	// 게시글 목록 조회
	/*
	 * @RequestMapping(value = "postList.do") public List<Post>
	 * sySelectPost(@ModelAttribute Post post, HttpServletRequest request, Model
	 * model) throws Exception {
	 * System.out.println("SyPostController syPostSelect()"); List<Post>
	 * sySelectPost = syPostServiceImpl.selectPost(post);
	 * model.addAttribute("sySelectPost", syPostServiceImpl.selectPost(post));
	 * 
	 * return "sy/postList"; }
	 */
	
	/*
	 * public String syPostView(@ModelAttribute("post") Post post,
	 * HttpServletRequest request, Model model) throws Exception { int userId =
	 * Integer.parseInt(request.getParameter("userId")); post.setUser_id(userId);
	 * 
	 * Post resultPost = syPostServiceImpl.selectPostDetail(post);
	 * model.addAttribute("result", resultPost);
	 * 
	 * return "redirect:testList.do";
	 * 
	 * }
	 */

	// 게시글 작성
	@RequestMapping(value = "")
	public String syInsertPost(Post post, HttpServletRequest request, Model model) throws Exception {
		System.out.println("SyPostController syInsertPost()");
		/* String postId = checkId(request); */
		/* model.addAttribute("postId", postId); */
		syPostServiceImpl.insertPost(post);

		return "redirect:sy/postList";
	}

	// 게시글 수정
	@RequestMapping(value = "/postUpdate.do")
	public String syUpdatePost(@ModelAttribute("Post") Post post, HttpServletRequest request, Model model)
			throws Exception {
		System.out.println("SyPostController syUpdatePost()");
		syPostServiceImpl.updatePost(post);

		return "redirect:postList";
	}

	// 게시글 삭제
	@RequestMapping(value = "/postDelete.do")
	public String syDeletePost(@ModelAttribute("Post") Post post) throws Exception {
		System.out.println("SyPostController syDeletePost()");
		syPostServiceImpl.deletePost(post);

		return "redirect:postList";
	}

}
