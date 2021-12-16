package com.oracle.s20210904.sy.dao;

import java.util.List;
import java.util.Map;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.model.PostSearch;

public interface SyPostDao {
	
	List<Post> postSelect(PostSearch postSearch) throws Exception;
	
	public int postInsert(Post post) throws Exception;
	
	public Post postView(int post_code) throws Exception;
	
	public int postUpdate(Post post) throws Exception;
	
	public int postDelete(int post_code) throws Exception;
	
	List<Post> total(PostSearch postSearch) throws Exception;

	public void postViewCount(int post_code, String user_id) throws Exception;

	public Post postViewReply(int post_code) throws Exception;
	
	public int postReply(Post post) throws Exception;

}

