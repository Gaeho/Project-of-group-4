package com.oracle.s20210904.sy.service;

import java.util.List;
import java.util.Map;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.model.PostSearch;

public interface SyPostService {
	
	List<Post> postSelect(Post post) throws Exception;
	
	public int postInsert(Post post) throws Exception;
	
	public Post postView(int post_code) throws Exception;
	
	public int postUpdate(Post post) throws Exception;
	
	public int postDelete(int post_code) throws Exception;
	
	int total() throws Exception;
	
	public void postViewCount(int post_code) throws Exception;

	public Post postViewReply(int post_code) throws Exception;

	public int postReply(Post post) throws Exception;

	void updateRef(Post post);

	int noticetotal();

	List<Post> noticeList();

	List<Post> postSearch(Post post);

	int max();

	int searchTotal(String searchText);
}
