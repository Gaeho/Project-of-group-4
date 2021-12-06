package com.oracle.s20210904.sr.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;

public interface SrComMypageDao {

	int total();

	CommCompany comInfo(CommCompany commCompany);

	List<Announce> listAnnReg(Announce announce);

	List<Announce> listAnnCReg(Announce announce);

	List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem);

	List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem);

	List<CommMemResume> commMemResumeList(CommMemResume commMemResume);

}
