package com.oracle.s20210904.dj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.dj.model.DjSearch;

@Repository
public class DjSearchDaoImpl implements DjSearchDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<DjSearch> searchAnno(String mainsearch) {
		System.out.println("DjSearchDaoImpl의 searchAnno() 시작되었습니다");
		
		List<DjSearch> result = null;
		
		//String searchcontents = scContent.getMainsearch();
		System.out.println("db에 넣을 파라미터 searchcontents의 내용 확인->"+mainsearch);
		
		try {
			result = session.selectList("DjMainAnnoSearch", mainsearch);
			
			if(result != null) {
				System.out.println("(DjSearchDaoImpl)결과값에 뭔가 들어있나? 길이->"+result.size());
				
			}
			
			
		} catch (Exception e) {
			System.out.println("searchSome에서 에러발생!!! 삐용삐용!! ->"+e.getMessage());
		}
		
		
		return result;
	}

	@Override
	public List<Company> searchCom(String mainsearch) {
		System.out.println("DjSearchDaoImpl의 searchCom() 시작되었습니다");
		
		List<Company> result1 = null;
		
		System.out.println("db에 넣을 파라미터 searchcontents의 내용 확인->"+mainsearch);
		
		try {
			result1 = session.selectList("DjMainComSearch", mainsearch);
			
			if(result1 != null) {
				System.out.println("(DjSearchDaoImpl)결과값에 뭔가 들어있나? 길이->"+result1.size());
				
			}
			
			
		} catch (Exception e) {
			System.out.println("searchSome에서 에러발생!!! 삐용삐용!! ->"+e.getMessage());
		}
		
		return result1;
	}
	
	
	
	
}
