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
	public List<Post> postSelect(PostSearch postSearch) throws Exception {
		/* List<Post> postSelect = syPostDaoImpl.postSelect(postSearch); */		
		return syPostDaoImpl.postSelect(postSearch);
	}
	
	@Override
	public void postInsert(Post post) throws Exception {
		
		syPostDaoImpl.postInsert(post);	
	}
	
/*	public Post postView(int post_code) throws Exception {
		return syPostDaoImpl.postView(post_code);
	} */
	
	public List<Post> postView(int post_code) throws Exception {
		return syPostDaoImpl.postView(post_code);
	}

	@Override
	public void postUpdate(Post post) throws Exception {
		
		syPostDaoImpl.postUpdate(post);		
	}

	@Override
	public void postDelete(String user_id) throws Exception {
		
		syPostDaoImpl.postDelete(user_id);	
	}
	
/*	@Override
	public int total(PostSearch postSearch) throws Exception {	
		
		int totalCount = syPostDaoImpl.total(postSearch);

		return totalCount;
	} */
	
	public List<Post> total(PostSearch postSearch) throws Exception {
		
		List<Post> totalCount = syPostDaoImpl.total(postSearch);
		
		return totalCount;
	}
	
	@Override
	public boolean postReply(Post post) {
		return syPostDaoImpl.postReply(post);
	}
	
	@Override
	public List<Post> postGetReply(int post_code) {
		return syPostDaoImpl.postGetReply(post_code);
	}

}
