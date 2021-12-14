package com.oracle.s20210904.sy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.model.PostSearch;

@Service("SyPostDaoImpl")
public class SyPostDaoImpl implements SyPostDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Post> postSelect(PostSearch postSearch) throws Exception {
		/* List<Post> postSelect = null; */
		return sqlSession.selectList("postSelect", postSearch);

	}
	
	@Override
	public void postInsert(Post post) throws Exception {
		
		sqlSession.insert("postInsert", post);
	}

/*	@Override
	public Post postView(int post_code) throws Exception {
		
		return sqlSession.selectOne("postView", post_code);
	} */
	
	@Override
	public List<Post> postView(int post_code) throws Exception {
		
		return sqlSession.selectList("postView", post_code);
	}

	@Override
	public void postUpdate(Post post) throws Exception {
		
		sqlSession.update("postUpdate", post);
	}

	@Override
	public void postDelete(String user_id) throws Exception {
		
		sqlSession.delete("postDelete", user_id);	
	}
	
/*	@Override
	public int total(PostSearch postSearch) throws Exception {
		
		int total = 0;
		total = sqlSession.selectOne("postTotal");
		
		return total;
	} */
	
	@Override
	public List<Post> total(PostSearch postSearch) throws Exception {
		
		return sqlSession.selectList("postTotal", postSearch);
		
	}

	@Override
	public boolean postReply(Post post) {
		
		sqlSession.insert("postReply", post);
		
		return true;
	}

	@Override
	public List<Post> postGetReply(int post_code) {
		
		List<Post> postGetReply = null;
		postGetReply = sqlSession.selectList("postGetReply", post_code);
		
		return postGetReply;
	}
}
