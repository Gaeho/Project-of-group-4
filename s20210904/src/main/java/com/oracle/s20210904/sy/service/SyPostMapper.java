package com.oracle.s20210904.sy.service;

import java.util.List;

import com.oracle.s20210904.comm.model.Post;

public interface SyPostMapper {
	
	public List<Post> selectPost(Post post) throws Exception;
	
	public void insertPost (Post post) throws Exception;
	
	public Post selectPostDetail(Post post) throws Exception;
	
	public void updatePost(Post post) throws Exception;
	
	public void deletePost(Post post) throws Exception;
}
