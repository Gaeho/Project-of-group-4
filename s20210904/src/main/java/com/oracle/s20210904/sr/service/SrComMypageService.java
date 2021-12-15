package com.oracle.s20210904.sr.service;

import java.util.List;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.model.CommResMemBook;
import com.oracle.s20210904.sr.model.MemResumeBmark;

public interface SrComMypageService {

	int total();

	CommCompany comInfo(CommCompany commCompany);

	List<Announce> listAnnReg(Announce announce);

	List<Announce> listAnnCReg(Announce announce);

	List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem);

	List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem);

	
	List<MemBmark> bookmarkList(MemBmark memBmark);

	CommResMemBook userdetail(CommResMemBook commResMemBook, Integer isResume);

	int bookmarkgetinfo(Bookmark bookmark);

	void bookmarkinsert(Bookmark bookmark);

	void bookmarkdelete(Bookmark bookmark);

	int insertResumeContect(ResumeContect resumeContect);

	ResumeContect findRC(ResumeContect resumeContect);

	void insertNotice(Notice notice);


	List<MemResumeBmark> memResumeBmarkList(String keyword1);

	Member member2(Member member);

	List<Resume> userIdListbyResume(Resume resume);

	CommMemResume comAppStatusListdetail(String user_id);

	

	

}
