package com.oracle.s20210904.sy.service;

import java.util.List;

import com.oracle.s20210904.sy.model.SySearch;

public interface SySearchService {
	
	List<SySearch> searchPost(SySearch sySearch);
}
