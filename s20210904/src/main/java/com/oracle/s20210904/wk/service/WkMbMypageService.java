package com.oracle.s20210904.wk.service;

import java.util.List;

import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeDetail;
import com.oracle.s20210904.wk.model.WkApply;
import com.oracle.s20210904.wk.model.WkApplyCount;
import com.oracle.s20210904.wk.model.WkCommDto;
import com.oracle.s20210904.wk.model.WkNotice;
import com.oracle.s20210904.wk.model.WkResume;
import com.oracle.s20210904.wk.model.WkResumeDetail;
import com.oracle.s20210904.wk.model.WkScrap;

public interface WkMbMypageService {

	List<WkApplyCount> countApply(String mbid);

	List<WkResume> resumeList(String mbid);

	List<WkApply> applyList(String mbid);

	Member memberDetail(String mbid);

	List<WkScrap> scarpList(String mbid);

	int scarpCount(String mbid);

	int memberUpdate(Member member);

	List<WkCommDto> commList(String main_cat);

	int resumeWrite(WkResume wkResume, WkResumeDetail wkResumeDetail);

	int resumeDelete(Resume resume);

	Resume resumeSelect(Resume resume);

	List<ResumeDetail> resumeDetailSelect(Resume resume);

	int resumeUpdate(Resume resume, WkResumeDetail wkResumeDetail);

	List<WkNotice> resConList(String mbid);

	int repResumeUpdate(Resume resume);

	void noticeDelete(String mbid, String notice_apply, String notice_resCon);

	String memberImg(String mbid);

}
