package com.oracle.s20210904.dj.dao;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.dj.model.DjSearch;

@Repository
public class DjSearchDaoImpl implements DjSearchDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<DjSearch> searchSome(DjSearch scContent) {
		System.out.println("DjSearchDaoImpl의 searchSome() 시작되었습니다");
		
		List<DjSearch> result = null;
		
		String searchcontents = scContent.getMainsearch();
		
		try {
			result = session.selectList("DjMainSearch", searchcontents);
			
			if(result != null) {
				System.out.println("결과값에 뭔가 들어있나?"+result.size());
				
			}
			
			
		} catch (Exception e) {
			System.out.println("searchSome에서 에러발생!!! 삐용삐용!! ->"+e.getMessage());
		}
		
		
		return result;
	}
	
	
	
	
}
