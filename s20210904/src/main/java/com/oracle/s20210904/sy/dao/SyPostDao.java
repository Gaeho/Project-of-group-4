
package com.oracle.s20210904.sy.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Post;

public interface SyPostDao {

	List<Post> selectPost(Post post) throws Exception;
	
	void insertPost(Post post) throws Exception;
	
	Post selectPostDetail(Post post) throws Exception;
	
	void updatePost(Post post) throws Exception;

	void deletePost(Post post) throws Exception;

}
