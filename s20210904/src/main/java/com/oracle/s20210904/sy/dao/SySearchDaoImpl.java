package com.oracle.s20210904.sy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.sy.model.SySearch;

@Repository
public class SySearchDaoImpl implements SySearchDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SySearch> searchPost(SySearch sySearch) {
		System.out.println("SySearchDaoImpl searchPost START");	
		List<SySearch> result = null;		
		try {
			result = sqlSession.selectList("SyPostSearch", sySearch);
			
			if (result != null) {
				System.out.println("SySearchDaoImpl Result : "+result.size());
			}
		} catch (Exception e) {
			System.out.println("SySearchDaoImpl searchPost Exception : "+e.getMessage());
		}
		return result;
	}

}
