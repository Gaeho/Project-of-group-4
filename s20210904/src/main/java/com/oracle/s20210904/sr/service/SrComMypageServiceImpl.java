package com.oracle.s20210904.sr.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.dao.SrComMypageDao;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.model.CommResMemBook;
import com.oracle.s20210904.sr.model.MemResumeBmark;

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
	
	// 북마크 List
	@Override
	public List<MemBmark> bookmarkList(MemBmark memBmark ) {
		
		List<MemBmark> bookmarkList = null;
		System.out.println("SrComMypageServiceImpl bookmarkList Start...");
		bookmarkList = scmd.bookmarkList(memBmark);
		System.out.println("SrComMypageServiceImpl bookmarkList.size"+bookmarkList.size());
		
		
		return bookmarkList;
	}
	
	
	
		
	// 북마크 개인 상세
	@Override
	public CommResMemBook userdetail(CommResMemBook commResMemBook, Integer isResume) {
		System.out.println("3.SrComMypageServiceImpl userdetail Start...");
		CommResMemBook mem = scmd.userdetail(commResMemBook, isResume);
//		System.out.println("Service mem.getUser_name()->"+mem.getUser_name());
//		System.out.println("Service mem.getUser_addr()->"+mem.getUser_addr());
	
		return mem;
	}

	// 북마크 유무
	@Override
	public int bookmarkgetinfo(Bookmark bookmark) {
		System.out.println("7.SrComMypageServiceImpl bookmarkgetinfo Start...");
		int getinfo = scmd.getinfo(bookmark);
		System.out.println("10.Service getinfo->"+getinfo);
		
		return getinfo;
	}

	// 북마크 추가
	@Override
	public void bookmarkinsert(Bookmark bookmark) {
		System.out.println("SrComMypageServiceImpl bookmarkinsert Start...");
		scmd.bookmarkinsert(bookmark);
	}

	// 북마크 삭제
	@Override
	public void bookmarkdelete(Bookmark bookmark) {
		System.out.println("SrComMypageServiceImpl bookmarkdelete Start...");
		scmd.bookmarkdelete(bookmark);
	}	

	
	@Override
	public List<MemResumeBmark> memResumeBmarkList(String keyword1) {
		List<MemResumeBmark> memResumeBmarkList=scmd.memResumeBmarkList(keyword1);
			return memResumeBmarkList;
		}


	//열람 기록 있는지 Check
	@Override
	public ResumeContect findRC(ResumeContect resumeContect) {
		System.out.println("SrComMypageServiceImpl findRC Start...");
		ResumeContect rc = scmd.findRC(resumeContect);
		return rc;
	}
	
	// 이력서열람 INSERT
	@Override
	public int insertResumeContect(ResumeContect resumeContect) {
		System.out.println("SrComMypageServiceImpl insertResumeContect Start...");
		int result =scmd.insertResumeContect(resumeContect);
		return result;
	}
	
	// 알림추가~
	@Override
	public void insertNotice(Notice notice) {
		System.out.println("SrComMypageServiceImpl insertNotice Start...");
		scmd.insertNotice(notice);
	}

	@Override
	public Member member2(Member member) {
		Member member3=scmd.member4(member);
		return member3;
	}

	@Override
	public List<Resume> userIdListbyResume(Resume resume) {
		List<Resume> resume2=scmd.userIdListbyResume(resume);
		return resume2;
	}

	@Override
	public CommMemResume comAppStatusListdetail(String user_id) {
		CommMemResume comAppStatusListdetail=scmd.comAppStatusListDetail(user_id);
		return comAppStatusListdetail;
	}
	
	@Override
	public List<Announce> AnnounceList(String comid) {
		List<Announce> annoList = scmd.AnnounceList(comid);
		return annoList;
	}
	
	@Override
	public int applyTotCnt(String anno_code) {
		int applyTotCnt = scmd.applyTotCnt(anno_code);
		return applyTotCnt;
	}

	@Override
	public void memFail(Apply apply) {
		scmd.memFail(apply);
	}
	
	@Override
	public void memPass(Apply apply) {
		scmd.memPass(apply);
	}

	@Override
	public void applyStsUpdate(Apply apply) {
		scmd.applyStsUpdate(apply);
	}

	@Override
	public List<Announce> listAnn(Announce announce) {
		System.out.println("SrComMypageServiceImpl listAnnReg이 시작되었댱~~~");
		List<Announce> listAnn=scmd.listAnn(announce);
		System.out.println("SrComMypageServiceImpl listAnnReg CHECK....");
		return listAnn;
	}

	@Override
	public Bookmark bookmark(Bookmark bookmark) {
		Bookmark bookmark2=scmd.bookmark(bookmark);
		return bookmark2;
	}

	@Override
	public void noticeDel(String ntc_code) {
		scmd.noticeDel(ntc_code);
	}

	
}
