package com.oracle.s20210904.dj.dao;

import java.util.List;

import com.oracle.s20210904.dj.model.DjSearch;

public interface DjSearchDao {

	List<DjSearch> searchSome(DjSearch scContent);

}
