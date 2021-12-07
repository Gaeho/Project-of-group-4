package com.oracle.s20210904.sr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.service.SrComMypageService;

@Controller
public class SrComMypageController {

	@Autowired
	private SrComMypageService scms;

	// 기업정보
	@GetMapping(value = "ComInfo")
	public String ComInfo(Model model, CommCompany commCompany) {

		System.out.println("SrComMypageController ComInfo START...");

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		model.addAttribute("commCompany1", commCompany1);

		return "sr/comInfoMenu";
	}

	// 채용공고
	@GetMapping(value = "ComAnn")
	public String ComAnn(CommCompany commCompany, Model model, Announce announce, String currentPage, String id) {

		System.out.println("SrComMypageController ComAnn START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		announce.setStart(pg.getStart()); // 1
		announce.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// announce list
		List<Announce> listAnn = scms.listAnnReg(announce);
		if (id != null) {
			if (id.equals("0")) {
				listAnn = scms.listAnnReg(announce);
				System.out.println("bnt1");
				System.out.println("SrComMypageController listAnn listAnnReg size=>" + listAnn.size());

			} else {
				listAnn = scms.listAnnCReg(announce);
				System.out.println("bnt2");
				System.out.println("SrComMypageController listAnn listAnnCReg size=>" + listAnn.size());

			}
		}
		// ----------------------------------------------------------------------------
		System.out.println("SrComMypageController ComAnn total=>" + total);
		System.out.println("SrComMypageController ComAnn company1=>" + commCompany1);
		System.out.println("SrComMypageController ComAnn listAnn=>" + listAnn);
		// ----------------------------------------------------------------------------
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("listAnn", listAnn);

		return "sr/comAnnMenu";
	}

	// 지원현황
	@GetMapping(value = "ComAppStatus")
	public String ComAppStatus(Model model, String currentPage, Member member, AppAnnMem appAnnMem,
			CommCompany commCompany, String id) {

		System.out.println("SrComMypageController ComAppStatus START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		appAnnMem.setStart(pg.getStart()); // 1
		appAnnMem.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// apply+member+announce JOIN list
		List<AppAnnMem> appAnnMember = scms.appAnnMemReg(appAnnMem);
		if (id != null) {
			if (id.equals("0")) {
				appAnnMember = scms.appAnnMemReg(appAnnMem);
				System.out.println("bnt1");
				System.out.println("SrComMypageController appAnnMember appAnnMemReg size=>" + appAnnMember.size());
			} else {
				appAnnMember = scms.appAnnMemCReg(appAnnMem);
				System.out.println("bnt2");
				System.out.println("SrComMypageController appAnnMember appAnnMemCReg size=>" + appAnnMember.size());

			}
		}
		// ----------------------------------------------------------------------------
		System.out.println("SrComMypageController ComAppStatus total=>" + total);
		System.out.println("SrComMypageController ComAppStatus company1=>" + commCompany1);
		System.out.println("SrComMypageController ComAppStatus appAnnMember=>" + appAnnMember);
		for (AppAnnMem appAnnMember1 : appAnnMember) {
			System.out.println("appAnnMember1.getApp_regdate()->" + appAnnMember1.getApp_regdate());
			System.out.println("appAnnMember1.getUser_id()->" + appAnnMember1.getUser_id());
			System.out.println("appAnnMember1.getUser_img()->" + appAnnMember1.getUser_img());
		}
		// ----------------------------------------------------------------------------
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("appAnnMember", appAnnMember);

		return "sr/comAppStatusMenu";
	}

	// 회원검색
	@GetMapping(value = "ComMemberSearch")
	public String ComMemberSearch(Model model, String currentPage, CommMemResume commMemResume, CommCompany commCompany) {

		System.out.println("SrComMypageController ComMemberSearch START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		commMemResume.setStart(pg.getStart()); // 1
		commMemResume.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// commMemResume list
		List<CommMemResume> commMemResumeList=scms.commMemResumeList(commMemResume);
		
		return "sr/comMemberSearchMenu";
	}
	
	// 북마크회원
		@GetMapping(value = "ComMarkMember")
		public String ComMarkMember(String user_id, Model model, String currentPage, CommCompany CommCompany , Bookmark bookmark) {
			// 북마크 유무
			String com_id ="tlstprp5184";
			//String user_id = "dmdtla054";
			//------------------------------------------------------------------------
			
			System.out.println("SrComMypageController ComMarkMember가 시작되었다귱~~");
			int total = scms.total();
			System.out.println("SrComMypageController total=>" + total);
			// Paging
			Paging pg = new Paging(total, currentPage);
			// list
			bookmark.setStart(pg.getStart()); // 1
			bookmark.setEnd(pg.getEnd()); // 5

			
			//--------------------------------------------------------------------------
			
			System.out.println("SrComMypageController listBmark 시작");

			List<Bookmark> listBmark = scms.listBmark1(bookmark);

			System.out.println("SrComMypageController listBmark size=>"+listBmark.size());

			for (Bookmark listBmarkk : listBmark) {
				System.out.println("listBmarkk.getUser_id=>" + listBmarkk.getUser_id());
				System.out.println("listBmarkk.getCom_id=>" + listBmarkk.getCom_id());
			}
			
			//---------------------------------------------------------------------------
			// company
			CommCompany commCompany1 = null;
			commCompany1 = scms.comInfo(CommCompany);
			//---------------------------------------------------------------------------
			
			/*
			 * MemBmark memBmark1=null; memBmark1=scms.memBmark2(memBmark);
			 */
			

			
			//--------------------------------------------------------------------------
			//---------------------------------------------------------------------------

			model.addAttribute("total", total);
			model.addAttribute("listBmark", listBmark);
			System.out.println("listBmark 확인=>" + listBmark);
			System.out.println("listBmark 확인=>" + model);
			model.addAttribute("pg", pg);
			model.addAttribute("commCompany1", commCompany1);
//			model.addAttribute("memBmark1", memBmark1);

			// ---------------------------------------------------------------------------
			
			
			//Bookmark bookmark = new Bookmark();
			bookmark.setCom_id(com_id);
			bookmark.setUser_id(user_id);
			
			int itbookmark = scms.bookmarkgetinfo(bookmark);
			System.out.println("Controller itbookmark->"+itbookmark);
			model.addAttribute("itbookmark", itbookmark);


			return "sr/comMarkMemberMenu";
		}
		
		// 북마크 개인 상세
		@GetMapping(value = "detail2")
		public String detail(String user_id, Member member, Model model) {
			System.out.println("SrComMypageController detail Start...");
			Member mem = scms.userdetail(user_id);
			model.addAttribute("mem", mem);
			System.out.println("----------------------------------------");
			System.out.println("mem.getUser_name()->"+mem.getUser_name());
			System.out.println("mem.getUser_email()->"+mem.getUser_email());
			System.out.println("mem.getUser_tel()->"+mem.getUser_tel());
			System.out.println("mem.getUser_addr()->"+mem.getUser_addr());
			System.out.println("----------------------------------------");		
			
			// 공통 테이블에서 원하는 직종 가져오기
			System.out.println("SrComMypageController jobtag Start...");
			Comm jobtag = scms.jobtag(mem);
			System.out.println("SrComMypageController jobtag.getComm_ctx()->"+jobtag.getComm_ctx());
			model.addAttribute("jobtag", jobtag);
		
			
			return "sr/comMarkMemDetail";
		}
		
		// 북마크
		@RequestMapping(value = "bookmark", produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String bookmark (String com_id, String user_id, int it_bookmark, Model model) {
			System.out.println("SrComMypageController bookmark Start...");
			
			Bookmark bookmark = new Bookmark();
			bookmark.setCom_id(com_id);
			bookmark.setUser_id(user_id);
			
			System.out.println("SrComMypageController bookmark com_id->"+com_id);
			System.out.println("SrComMypageController bookmark user_id->"+user_id);
			System.out.println("SrComMypageController bookmark it_bookmark->"+it_bookmark);
			
			/* int check = as.likecnt(scrap); */
			String imgSrc = null; // ajax로 리턴 될 놈 ex)img에 들어갈 src
			
			
			if (it_bookmark == 0) { // 스크랩하기
				scms.bookmarkinsert(bookmark);
				imgSrc = "북마크취소IMGSRC";
			} else if (it_bookmark == 1) { // 스크랩취소
				scms.bookmarkdelete(bookmark);
				imgSrc = "북마크하기IMGSRC";
			}

			return imgSrc;

		 }
		
		@GetMapping(value="resumeDetail")
		public String resumeDetail(ResumeContect resumeContect,Model model) {
			insertResumeContect(resumeContect);
			resumeContect = scms.findRC(resumeContect);
			
			model.addAttribute("resumeContect",resumeContect);
			
			return "sr/resumeDetail";
		}
		
		// 이력서 조회시 이력서열람 INSERT
		public int insertResumeContect(ResumeContect resumeContect) {
			
			int result = 0;
			// 열람기록 존재하는지~ 없으면 null~
			ResumeContect rc = scms.findRC(resumeContect);
			
			// 없으면 인서트할게요~
			if(rc==null) {
				result = scms.insertResumeContect(resumeContect);
				// 인서트 확인~성공시 1 성공했으면 알림 추가할게요~
				if(result==1) {
					// 알ㄹ
					rc = scms.findRC(resumeContect);
					Notice notice = new Notice();
					notice.setUser_id(rc.getUser_id());
					notice.setNtc_cat("003");
					notice.setNtc_code(rc.getNtc_code());
					scms.insertNotice(notice);
				}
			}
			return result;
		}
}
