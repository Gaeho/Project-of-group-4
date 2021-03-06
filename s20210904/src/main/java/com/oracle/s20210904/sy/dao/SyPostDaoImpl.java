package com.oracle.s20210904.sy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.sy.model.PostSearch;

@Service("SyPostDaoImpl")
public class SyPostDaoImpl implements SyPostDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Post> postSelect(Post post) throws Exception {
		List<Post> result = null;
		try {
			result = sqlSession.selectList("postSelect", post);
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postSelect Exception : "+e.getMessage());
		}
		return result;
	}
	
	@Override
	public int postInsert(Post post) throws Exception {
		int result = 0;
		try {
			System.out.println("SyPostDaoImpl postInsert START");
			System.out.println("SyPostDaoImpl postInsert post getPost_code->"+post.getPost_code());
			System.out.println("SyPostDaoImpl postInsert post getBrd_code->"+post.getBrd_code());	
		    System.out.println("SyPostDaoImpl postInsert post getPost_title->"+post.getPost_title());		    
		    System.out.println("SyPostDaoImpl postInsert post getPost_ctx->"+post.getPost_ctx());
		    System.out.println("SyPostDaoImpl postInsert post getPost_regdate->"+post.getPost_regdate());    
		    System.out.println("SyPostDaoImpl postInsert post getUser_id->"+post.getUser_id());	
		   
		    if(!(post.getUser_id().equals("rhksflwk0000"))) {
				result = sqlSession.insert("postInsert", post);
		   }else {
			   post.setBrd_code("공지");
			   result = sqlSession.insert("postInsert", post);
		   }

			
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postInsert Exception : "+e.getMessage());
		}		
		return result;
	}

	@Override
	public Post postView(int post_code) throws Exception {
		Post result = null;
		try {
			System.out.println("syPostDaoImpl postView START");
			result = sqlSession.selectOne("postView", post_code);
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postInsert Exception : "+e.getMessage());
		}		
		return result;
	} 

	@Override
	public int postUpdate(Post post) throws Exception {
		int result = 0;
		try {
			System.out.println("syPostDaoImpl postUpdate START");
			result = sqlSession.update("postUpdate", post);
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postUpdate Exception : "+e.getMessage());
		}	
		return result;
	}

	@Override
	public int postDelete(int post_code) throws Exception {
		int result = 0;
		try {
			System.out.println("syPostDaoImpl postDelete START");
			result = sqlSession.delete("postDelete", post_code);	
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postDelete Exception : "+e.getMessage());
		}
		return result;
	}
	
	@Override
	public int total() throws Exception {
		int result =0;
		try {
			System.out.println("syPostDaoImpl total START");
			result =  sqlSession.selectOne("postTotal");
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl total Exception : "+e.getMessage());
		}	
		return result;
	}
	
	@Override
	public void postViewCount(int post_code) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("post_code", post_code);
//		map.put("user_id", user_id);
		System.out.println("DaoImpl post_code="+post_code);
		sqlSession.update("postViewCount", post_code);
		
//		if(result == null) {
//			sqlSession.update("postViewCount", post_code);
//			sqlSession.insert("addUserToViewCount", map);
//		}
	}
	
	@Override
	public Post postViewReply(int post_code) throws Exception {
		Post result = null;
		try {
			System.out.println("syPostDaoImpl postReplyView START");
			result = sqlSession.selectOne("postView", post_code);
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postReplyView Exception : "+e.getMessage());
		}		
		return result;
	}
	
	@Override
	public int postReply(Post post) throws Exception {
		int result = 0;
		try {
			System.out.println("SyPostDaoImpl postReply START");
		    System.out.println("SyPostDaoImpl postReply post getPost_code->"+post.getPost_code());
		    System.out.println("SyPostDaoImpl postReply post getBrd_code->"+post.getBrd_code());
		    System.out.println("SyPostDaoImpl postReply post getPost_title->"+post.getPost_title());	
		    System.out.println("SyPostDaoImpl postReply post getPost_ctx->"+post.getPost_ctx());
		    System.out.println("SyPostDaoImpl postReply post getPost_regdate->"+post.getPost_regdate());
		    System.out.println("SyPostDaoImpl postReply post getUser_id->"+post.getUser_id());		
		    System.out.println("SyPostDaoImpl postReply post getRef->"+post.getRef());	
		    System.out.println("SyPostDaoImpl postReply post getRef_step->"+post.getRef_step());	
		    System.out.println("SyPostDaoImpl postReply post getRef_lev->"+post.getRef_lev());	
		   
			result = sqlSession.insert("postReply", post);
			
		} catch (Exception e) {
			System.out.println("SyPostDaoImpl postReply Exception : "+e.getMessage());
		}		
		return result;
	}
	
	@Override
	public void updateRef(Post post) {
		sqlSession.update("SyUpdateRef",post);
		
	}
	
	@Override
	public int noticeCount() {
		int result = sqlSession.selectOne("SyNoticeCount");
		return result;
	}
	
	@Override
	public List<Post> noticeList() {
		List<Post> noticeList = sqlSession.selectList("SyNoticeList");
		return noticeList;
	}
	
	@Override
	public List<Post> postSearch(Post post) {
		List<Post> postSearch = sqlSession.selectList("SySearchPost",post);
		return postSearch;
	}
	
	@Override
	public int max() {
		int maxCount = sqlSession.selectOne("max");
		return maxCount;
	}
	
	@Override
	public int searchTotal(String searchText) {
		int total = sqlSession.selectOne("searchTotal",searchText);
		return total;
	}
}
