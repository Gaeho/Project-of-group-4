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


	@Override
	public int applyNoticeDelete(String mbid) {
		System.out.println("WkNoticeDaoImpl applyNoticeDelete()");
		int result=0;
		try {
			result=session.delete("WkNoticeApplyDelete", mbid);
			result=session.update("WkApplyNoticeDelete", mbid);
			if(result>0) {
				
			}
		} catch (Exception e) {
			System.out.println("WkNoticeDaoImpl applyNoticeDelete() error : "+e.getMessage());
			throw new RuntimeException();
		}
		return result;
		
	}


	@Override
	public int resConNoticeDelete(String mbid) {
		System.out.println("WkNoticeDaoImpl resConNoticeDelete()");
		int result=0;
		try {
			result=session.delete("WkNoticeResConDelete", mbid);
			result=session.update("WkResConNoticeDelete", mbid);
			if(result>0) {
				
			}
		} catch (Exception e) {
			System.out.println("WkNoticeDaoImpl resConNoticeDelete() error : "+e.getMessage());
			throw new RuntimeException();
		}
		return result;
		
	}
	
	
}
