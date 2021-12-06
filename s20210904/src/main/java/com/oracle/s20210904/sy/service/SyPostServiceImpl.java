package com.oracle.s20210904.sy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.dao.SyPostDao;

@Service("syPostServiceImpl")
public class SyPostServiceImpl implements SyPostService {

	@Autowired
	private SyPostDao SyPostDaoImpl;
	
	@Override
	public List<Post> selectPost(Post post) throws Exception {
		return SyPostDaoImpl.selectPost(post);
	}

	@Override
	public void insertPost(Post post) throws Exception {
		SyPostDaoImpl.insertPost(post);
	}

	@Override
	public Post selectPostDetail(Post post) throws Exception {
		return SyPostDaoImpl.selectPostDetail(post);
	}

	@Override
	public void updatePost(Post post) throws Exception {
		SyPostDaoImpl.updatePost(post);
	}

	@Override
	public void deletePost(Post post) throws Exception {
		SyPostDaoImpl.deletePost(post);
	}
	
}
