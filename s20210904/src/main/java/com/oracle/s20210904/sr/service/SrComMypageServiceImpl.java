package com.oracle.s20210904.sr.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.dao.SrComMypageDao;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;

@Service
public class SrComMypageServiceImpl implements SrComMypageService {

	
	@Autowired
	private SrComMypageDao scmd;
	
	@Override
	public int total() {
		int totCnt = scmd.total();
		
		System.out.println("SrComMypageServiceImpl total START...");
		System.out.println("SrComMypageServiceImpl totCnt=>" + totCnt);
		
		return totCnt;
	}

	//기업정보
	@Override
	public CommCompany comInfo(CommCompany commCompany) {
		CommCompany commCompany1=null;
		System.out.println("SrComMypageServiceImpl comInfo START....");
		commCompany1=scmd.comInfo(commCompany);
		return commCompany1;
	}

	//채용공고 조인
	@Override
	public List<Announce> listAnnReg(Announce announce) {
		System.out.println("SrComMypageServiceImpl listAnnReg이 시작되었댱~~~");
		List<Announce> listAnnReg=scmd.listAnnReg(announce);
		System.out.println("SrComMypageServiceImpl listAnnReg CHECK....");
		return listAnnReg;
	}

	//채용공고 조인
	@Override
	public List<Announce> listAnnCReg(Announce announce) {
		System.out.println("SrComMypageServiceImpl listCAnnReg이 시작되었댱~~~");
		List<Announce> listAnnCReg=scmd.listAnnCReg(announce);
		System.out.println("SrComMypageServiceImpl listCAnnReg CHECK....");
		return listAnnCReg;
	}
	
	//지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemReg=scmd.appAnnMemReg(appAnnMem);
		return appAnnMemReg;
	}

	//지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemCReg=scmd.appAnnMemCReg(appAnnMem);
		return appAnnMemCReg;
	}

	//태그검색 조인
	@Override
	public List<CommMemResume> commMemResumeList(CommMemResume commMemResume) {
		List<CommMemResume> commMemResumeList=scmd.commMemResumeList(commMemResume);
		return commMemResumeList;
	}

	
}
