package com.oracle.s20210904.wk.dao;

import java.util.List;

import com.oracle.s20210904.wk.model.WkNotice;

public interface WkNoticeDao {

	List<WkNotice> resConList(String mbid);

	int applyNoticeDelete(String mbid);

	int resConNoticeDelete(String mbid);

}
