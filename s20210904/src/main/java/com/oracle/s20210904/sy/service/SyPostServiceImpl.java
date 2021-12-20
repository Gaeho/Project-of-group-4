package com.oracle.s20210904.sy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.dao.SyPostDao;
import com.oracle.s20210904.sy.model.PostSearch;

@Service("syPostServiceImpl")
public class SyPostServiceImpl implements SyPostService {

	@Autowired
	private SyPostDao syPostDaoImpl;
	
	@Override
	public List<Post> postSelect(Post post) throws Exception {
		System.out.println("syPostServiceImpl.postSelect START");
		return syPostDaoImpl.postSelect(post);
	}
	
	@Override
	public int postInsert(Post post) throws Exception {
		System.out.println("syPostServiceImpl.postInsert START");
		int result = syPostDaoImpl.postInsert(post);
		return result;		
	}
	
	@Override
	public Post postView(int post_code) throws Exception {
		System.out.println("syPostServiceImpl.postView START");
		return syPostDaoImpl.postView(post_code);
	} 

	@Override
	public int postUpdate(Post post) throws Exception {
		System.out.println("syPostServiceImpl.postUpdate START");
		int result = syPostDaoImpl.postUpdate(post);
		return result;
	}

	@Override
	public int postDelete(int post_code) throws Exception {
		System.out.println("syPostServiceImpl.postDelete START");
		int result = syPostDaoImpl.postDelete(post_code);
		return result;
	}
	
	@Override
	public int total() throws Exception {	
		int totalCount = syPostDaoImpl.total();	
		return totalCount;
	}

	@Override
	public void postViewCount(int post_code) throws Exception {
		System.out.println("syPostServiceImpl.postViewCount START");
		syPostDaoImpl.postViewCount(post_code);		
	} 
	
	@Override
	public Post postViewReply(int post_code) throws Exception {
		System.out.println("syPostServiceImpl.postViewReply START");
		return syPostDaoImpl.postViewReply(post_code);
	} 
	
	@Override
	public int postReply(Post post) throws Exception {
		System.out.println("syPostServiceImpl.postReply START");
		int result = syPostDaoImpl.postReply(post);
		return result;
	}
	
	@Override
	public void updateRef(Post post) {
		System.out.println("syPostServiceImpl.updateRef START");
		syPostDaoImpl.updateRef(post);
		
	}
	
	@Override
	public int noticetotal() {
		System.out.println("syPostServiceImpl.noticetotal START");
		int result = syPostDaoImpl.noticeCount();
		return result;
	}
	
	@Override
	public List<Post> noticeList() {
		System.out.println("syPostServiceImpl.noticeList START");
		List<Post> noitceList = syPostDaoImpl.noticeList();
		return noitceList;
	}
	
	@Override
	public List<Post> postSearch(Post post) {
		List<Post> postSearch = syPostDaoImpl.postSearch(post);
		return postSearch;
	}
	
	@Override
	public int max() {
		int maxCount = syPostDaoImpl.max();
		return maxCount;
	}
}
