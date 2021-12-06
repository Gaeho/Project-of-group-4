package com.oracle.s20210904.sy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.service.SyPostMapper;

@Service("SyPostDaoImpl")
public class SyPostDaoImpl implements SyPostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시글 목록 조회
	@Override
	public List<Post> selectPost(Post post) throws Exception {
		SyPostMapper mapper = sqlSession.getMapper(SyPostMapper.class);
		return mapper.selectPost(post);
	}
	
	// 게시글 작성
	@Override
	public void insertPost(Post post) throws Exception {
		SyPostMapper mapper = sqlSession.getMapper(SyPostMapper.class);
		mapper.insertPost(post);
	}
	
	// 게시글 조회
	@Override
	public Post selectPostDetail(Post post) throws Exception {
		SyPostMapper mapper = sqlSession.getMapper(SyPostMapper.class);
		return mapper.selectPostDetail(post);
	}
	
	// 게시글 수정
	@Override
	public void updatePost(Post post) throws Exception {
		SyPostMapper mapper = sqlSession.getMapper(SyPostMapper.class);
		mapper.updatePost(post);
	}
	
	// 게시글 삭제
	@Override
	public void deletePost(Post post) throws Exception {
		SyPostMapper mapper = sqlSession.getMapper(SyPostMapper.class);
		mapper.deletePost(post);
		
	}
}
