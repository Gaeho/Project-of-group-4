package com.oracle.s20210904.sr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;

@Repository
public class SrComMypageDaoImpl implements SrComMypageDao {

	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		int tot = 0;
		System.out.println("SrComMypageDaoImpl total 시작!!");
		try {
			tot = session.selectOne("SrComTotal");
		} catch (Exception e) {
			System.out.println("SrComMypageDaoImpl total 작동오류=>" + e.getMessage());
		}

		return tot;
	}

	
	// 기업정보
	@Override
	public CommCompany comInfo(CommCompany commCompany) {
		CommCompany commCompany1 = null;
		System.out.println("SrComMypageDaoImpl comInfo START....");
		try {
			commCompany1 = session.selectOne("SrComInfo", commCompany);
			System.out.println("SrComMypageDaoImpl comInfo CHECK=>" + commCompany1);
		} catch (Exception e) {
			System.out.println("SrComMypageDaoImpl comInfo error" + e.getMessage());
		}

		return commCompany1;
	}

	// 채용공고
	@Override
	public List<Announce> listAnnReg(Announce announce) {
		System.out.println("SrComMypageDaoImpl listAnnReg START....");
		List<Announce> listAnnReg = session.selectList("SrComAnnReg", announce);
		System.out.println(listAnnReg);
		System.out.println("SrComMypageDaoImpl listAnnReg CHECK....");
		return listAnnReg;
	}

	// 채용공고
	@Override
	public List<Announce> listAnnCReg(Announce announce) {
		System.out.println("SrComMypageDaoImpl listAnnCReg START....");
		List<Announce> listAnnCReg = session.selectList("SrComAnnCReg", announce);
		System.out.println(listAnnCReg);
		System.out.println("SrComMypageDaoImpl listAnnCReg CHECK....");
		return listAnnCReg;
	}



	// 지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemReg = null;
		try {
			appAnnMemReg = session.selectList("SrAppAnnMemReg", appAnnMem);
			System.out.println("SrComMypageDaoImpl AppAnnMemReg CHECK1=>" + appAnnMemReg.size());
		} catch (Exception e) {
			System.out.println("appAnnMem error=>" + e.getMessage());
		}

		return appAnnMemReg;
	}

	// 지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem) {

		List<AppAnnMem> appAnnMemCReg = null;
		System.out.println(appAnnMem.getStart());
		System.out.println(appAnnMem.getEnd());
		try {
			appAnnMemCReg = session.selectList("SrAppAnnMemCReg", appAnnMem);
			System.out.println(appAnnMemCReg);
//			  System.out.println("SrComMypageDaoImpl AppAnnMemCReg CHECK2=>"+appAnnMemCReg.size());
		} catch (Exception e) {
			System.out.println("appAnnMem error=>" + e.getMessage());
		}
		return appAnnMemCReg;
	}

	// 태그검색 조인
	@Override
	public List<CommMemResume> commMemResumeList(CommMemResume commMemResume) {
		List<CommMemResume> commMemResumeList=session.selectList("SrCommMemResumeList", commMemResume);
		return commMemResumeList;
	}
}
