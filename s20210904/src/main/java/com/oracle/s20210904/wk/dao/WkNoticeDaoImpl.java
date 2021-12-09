package com.oracle.s20210904.wk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.wk.model.WkNotice;
import com.oracle.s20210904.wk.model.WkResume;

@Repository
public class WkNoticeDaoImpl implements WkNoticeDao{
	private final SqlSession session;
	@Autowired
	public WkNoticeDaoImpl(SqlSession session) {
		super();
		this.session = session;
	}
	
	
	@Override
	public List<WkNotice> resConList(String mbid) {
		System.out.println("WkNoticeDaoImpl resConList()");
		List<WkNotice> list=null;
		try {
			list=session.selectList("WkResConSelect", mbid);
		} catch (Exception e) {
			System.out.println("WkNoticeDaoImpl resConList() error : "+e.getMessage());
		}
		return list;
	}
	
	
}
