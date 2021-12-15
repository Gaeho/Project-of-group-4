package com.oracle.s20210904.sy.dao;

import java.util.List;
import java.util.Map;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.model.PostSearch;

public interface SyPostDao {
	
	List<Post> postSelect(PostSearch postSearch) throws Exception;
	
	public void postInsert(Post post) throws Exception;
	
//	public Post postView(int post_code) throws Exceptions;
	
	List<Post> postView(int post_code) throws Exception;
	
	public void postUpdate(Post post) throws Exception;
	
	public void postDelete(String user_id) throws Exception;

//	int total(PostSearch postSearch) throws Exception;
	
	List<Post> total(PostSearch postSearch) throws Exception;

	boolean postReply(Post post);

	List<Post> postGetReply(int post_code);
}

