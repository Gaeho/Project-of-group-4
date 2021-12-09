package com.oracle.s20210904.sr.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.MemResumeBmark;

public interface SrComMypageDao {

	int total();

	CommCompany comInfo(CommCompany commCompany);

	List<Announce> listAnnReg(Announce announce);

	List<Announce> listAnnCReg(Announce announce);

	List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem);

	List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem);

	List<CommMemResume> commMemResumeList(CommMemResume commMemResume);

	//List<Bookmark> listBmark3(Bookmark bookmark);
	
	List<MemBmark> bookmarkList(MemBmark memBmark);



	CommMemResume userdetail(String user_id);

	Comm jobtag(CommMemResume mem);

	int getinfo(Bookmark bookmark);

	void bookmarkinsert(Bookmark bookmark);

	void bookmarkdelete(Bookmark bookmark);

	int insertResumeContect(ResumeContect resumeContect);

	ResumeContect findRC(ResumeContect resumeContect);

	void insertNotice(Notice notice);


	List<MemResumeBmark> memResumeBmarkList(String keyword1);

	Comm hsmjr(CommMemResume mem);

	Comm restag1(CommMemResume mem);

	Comm restag2(CommMemResume mem);

	Comm restag3(CommMemResume mem);


	
}
