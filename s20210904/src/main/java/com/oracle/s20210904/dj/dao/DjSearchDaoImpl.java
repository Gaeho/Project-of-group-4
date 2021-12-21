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
	public List<DjSearch> searchAnno(DjSearch djsearch) {
		System.out.println("DjSearchDaoImpl의 searchAnno() 시작되었습니다");
		
		List<DjSearch> result = null;
		
		//String searchcontents = scContent.getMainsearch();
		System.out.println("db에 넣을 파라미터 searchcontents의 내용 확인(검색어)->"+djsearch.getMainsearch());
		
		try {
			result = session.selectList("DjMainAnnoSearch", djsearch);
			
			if(result != null) {
				System.out.println("(DjSearchDaoImpl)결과값에 뭔가 들어있나? 길이->"+result.size());
				
			}
			
			
		} catch (Exception e) {
			System.out.println("searchSome에서 에러발생!!! 삐용삐용!! ->"+e.getMessage());
		}
		
		
		return result;
	}

	@Override
	public List<Company> searchCom(Company company) {
		System.out.println("DjSearchDaoImpl의 searchCom() 시작되었습니다");
		
		List<Company> result1 = null;
		
		System.out.println("db에 넣을 파라미터 company객체의 start 내용 확인->"+company.getStart());
		
		try {
			result1 = session.selectList("DjMainComSearch", company);
			
			if(result1 != null) {
				System.out.println("(DjSearchDaoImpl)결과값에 뭔가 들어있나? 길이->"+result1.size());
				
			}
			
			
		} catch (Exception e) {
			System.out.println("searchSome에서 에러발생!!! 삐용삐용!! ->"+e.getMessage());
		}
		
		return result1;
	}

	@Override
	public int annocnt(DjSearch djsearch) {
		
		int annocnt_result = 0;
		
		try {
			annocnt_result = session.selectOne("DjAnnocnt", djsearch);
			System.out.println("annocnt에서 리턴 받은 검색된 결과 수->"+annocnt_result);
			
		} catch (Exception e) {
			System.out.println("DjSearchDaoImpl의  annocnt에서 에러 발생!!->"+e.getMessage());
		}
		
		
		return annocnt_result;
	}

	@Override
	public int comcnt(Company company) {
		
		int comcnt_result = 0;
		
		try {
			comcnt_result = session.selectOne("DjComcnt", company);
			System.out.println("annocnt에서 리턴 받은 검색된 결과 수->"+comcnt_result);
			
		} catch (Exception e) {
			System.out.println("DjSearchDaoImpl의  annocnt에서 에러 발생!!->"+e.getMessage());
		}
		
		
		return comcnt_result;
	}
	
	
	
	
}
