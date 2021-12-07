package com.oracle.s20210904.sr.service;

import java.util.List;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;

public interface SrComMypageService {

	int total();

	CommCompany comInfo(CommCompany commCompany);

	List<Announce> listAnnReg(Announce announce);

	List<Announce> listAnnCReg(Announce announce);

	List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem);

	List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem);

	List<CommMemResume> commMemResumeList(CommMemResume commMemResume);

	List<Bookmark> listBmark1(Bookmark bookmark);
	
	Member userdetail(String user_id);

	Comm jobtag(Member mem);

	int bookmarkgetinfo(Bookmark bookmark);

	void bookmarkinsert(Bookmark bookmark);

	void bookmarkdelete(Bookmark bookmark);

	int insertResumeContect(ResumeContect resumeContect);

	ResumeContect findRC(ResumeContect resumeContect);

	void insertNotice(Notice notice);


}
