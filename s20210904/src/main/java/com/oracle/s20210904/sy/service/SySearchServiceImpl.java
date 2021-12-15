package com.oracle.s20210904.sy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.sy.dao.SySearchDao;
import com.oracle.s20210904.sy.model.SySearch;

@Service
public class SySearchServiceImpl implements SySearchService {
	
	@Autowired
	private SySearchDao sySearchDaoImpl;
	
	@Override
	public List<SySearch> searchPost(SySearch sySearch) {
		System.out.println("SySearchServiceImpl searchPost START");
		
		return sySearchDaoImpl.searchPost(sySearch);
	}
}
