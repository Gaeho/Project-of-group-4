package com.oracle.s20210904.sy.dao;

import java.util.List;

import com.oracle.s20210904.sy.model.SySearch;

public interface SySearchDao {

	List<SySearch> searchPost(SySearch sySearch);
	
}
