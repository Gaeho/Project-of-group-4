package com.oracle.s20210904.gm.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.NoticeCom;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.comm.model.Scrap;

public interface GmAnnoDao {

	int total();

	List<ComAnnounce> listAnno(ComAnnounce comAnnounce);

	ComAnnounce detail(String anno_code);

	//List<Comm> recjob();

	Comm recjob(ComAnnounce com);

	Comm emptype(ComAnnounce com);

	Comm Techtag1(ComAnnounce comanno);

	Comm Techtag2(ComAnnounce comanno);

	Comm career(ComAnnounce comanno);

	Comm comsec(ComAnnounce comanno);

	void likeinsert(Scrap scrap);

	int likegetinfo(Scrap scrap);

	int applytotal();

	List<Resume> listres(Resume resume);

	void likedelete(Scrap scrap);

	Apply checkRC(Apply apply);

	int insertapplyDetail(Apply apply);

	void Noticeinesert(NoticeCom noticeCom);

	int applyResume(Apply apply);

	List<ComAnnounce> listsearchAnno(ComAnnounce comAnnounce);

	int searchtotal(String annosearch);

	NoticeCom selectNc(Apply apply);


	
	

	

}
