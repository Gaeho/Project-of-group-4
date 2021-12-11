package com.oracle.s20210904.dj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.dj.dao.DjSearchDao;
import com.oracle.s20210904.dj.model.DjSearch;

@Service
public class DjSearchServiceImpl implements DjSearchService {
	
	@Autowired private DjSearchDao dsd;
	  
	@Override 
	public List<DjSearch> searchAnno(DjSearch djsearch) {
	  System.out.println("DjSearchServiceImpl의 searchAnno 시작되었습니다.");
	
	  return  dsd.searchAnno(djsearch);  
	}

	@Override
	public List<Company> searchCom(Company company) {
		System.out.println("DjSearchServiceImpl의 searchCom 시작되었습니다.");
		
		return dsd.searchCom(company);
	}
	  
}
