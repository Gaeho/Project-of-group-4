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
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.model.CommResMemBook;
import com.oracle.s20210904.sr.model.MemResumeBmark;
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

	
	
	// 회원검색
	@RequestMapping(value = "ComMemSearch")
	public String ComMemberSearch1() {
		
		return "sr/comMemberSearchMenu";
	}
	
	
	
	@GetMapping(value = "SrSearch")
	public String ComMemberSearch(Model model, String currentPage, MemResumeBmark memResumeBmark, CommCompany commCompany,
			String keyword) {

		System.out.println("SrComMypageController ComMemberSearch START...");
	
		System.out.println("DjSearchController의 mainSearch() 실행되었습니다.");
	
		System.out.println("처음 컨트롤러에 들어올 때 mainsearch의 내용?->"+keyword);
		
		String keyword1 = keyword.replaceAll("\\s+","");

		System.out.println("변환한 mainsearch의 값->"+keyword1);
		
		//여기까지 검색어 띄어쓰기 처리
		
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------

		
		//keyword를 이용한 검색 내용
		
		System.out.println("memResumeBmarkList 시작..");
		List<MemResumeBmark>  memResumeBmarkList= scms.memResumeBmarkList(keyword1);
		System.out.println("List<MemResumeBmark>의 size?->"+memResumeBmarkList.size());
		for(MemResumeBmark memResumeBmarkList1 : memResumeBmarkList) {
			System.out.println("---------bookmarkList Start -------------");
			System.out.println("memResumeBmarkList1.getRes_title()-> "+memResumeBmarkList1.getRes_title());
			System.out.println("memResumeBmarkList1.getMrk_res_code()-> "+memResumeBmarkList1.getMrk_res_code());
			System.out.println("----------bookmarkList End------------------");
			
		}
		
		model.addAttribute("memResumeBmarkList", memResumeBmarkList); //검색한 내용 
		model.addAttribute("keyword1", keyword1);//검색 키워드
		model.addAttribute("commCompany1", commCompany1);
		
		String com_id="tlstprp5184";
		model.addAttribute("com_id", com_id);
		
		return "sr/comMemberSearchMenuDetail";

	}
	
	// 북마크 List
	@GetMapping (value = "bookmarkList")
	public String bookmarkList (String currentPage, MemBmark memBmark, Model model, CommCompany commCompany) {
		System.out.println("SrComMypageController Start List...");
		int total = scms.total();
		System.out.println("GmAnnoList total->"+total);
		System.out.println("----------------------------------");
		
		// Paging
		Paging pg = new Paging(total, currentPage);
		memBmark.setStart(pg.getStart()); // 1 
		memBmark.setEnd(pg.getEnd()); // 5
		
		System.out.println("SrComMypageController bookmarkList Start...");
		List<MemBmark> bookmarkList = scms.bookmarkList(memBmark);
		
		System.out.println("SrComMypageController bookmarkList.size()->"+bookmarkList.size());
		System.out.println("---------------------------------------------------------------");
		for(MemBmark MemBmark : bookmarkList) {
			System.out.println("---------bookmarkList Start -------------");
			System.out.println("MemBmark.getUser_id()-> "+MemBmark.getUser_id());
			System.out.println("MemBmark.getCom_id()->"+MemBmark.getCom_id());
			System.out.println("MemBmark.getIt_bookmark()->"+MemBmark.getIt_bookmark());
			System.out.println("MemBmark.getMrk_date()-> "+MemBmark.getMrk_date());
			System.out.println("MemBmark.getMrk_res_code())-> "+MemBmark.getMrk_res_code());
			System.out.println("----------bookmarkList End------------------");
			
		}
		
		model.addAttribute("total", total);
		model.addAttribute("bookmarkList", bookmarkList);
		model.addAttribute("pg", pg);
		
		return "sr/comMarkMemberMenu";
		
	}
	
	// 지원현황 list
		@GetMapping(value = "ComAppStatus")
		public String ComAppStatus(Model model, AppAnnMem appAnnMem, CommCompany commCompany
				, String id, String key) {

			System.out.println("SrComMypageController ComAppStatus START...");

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
			System.out.println("SrComMypageController ComAppStatus company1=>" + commCompany1);
			System.out.println("SrComMypageController ComAppStatus appAnnMember=>" + appAnnMember);
			for (AppAnnMem appAnnMember1 : appAnnMember) {
				System.out.println("appAnnMember1.getApp_regdate()->" + appAnnMember1.getAnno_title());
				System.out.println("appAnnMember1.getUser_id()->" + appAnnMember1.getUser_id());
				System.out.println("appAnnMember1.getUser_img()->" + appAnnMember1.getUser_img());
				System.out.println("appAnnMember1.getAnno_code->" + appAnnMember1.getAnno_code());
			}
			// ----------------------------------------------------------------------------
			model.addAttribute("commCompany1", commCompany1);
			model.addAttribute("appAnnMember", appAnnMember);
			model.addAttribute("key", key);

			return "sr/comAppStatusMenu";
		}
	
	// 지원현황+북마크 상세(이력서 포함)
		@GetMapping(value = "detail2")
		public String detail(String user_id, String com_id, Integer mrk_res_code, Integer isResume, CommMemResume commMemResume, Model model,
				CommResMemBook commResMemBook, CommCompany commCompany) {
			
			System.out.println("뷰에서 넘어온 com_id=>"+com_id);
			System.out.println("뷰에서 넘어온 user_id=>"+user_id);
			System.out.println("뷰에서 넘어온 mrk_res_code=>"+mrk_res_code);
			
			System.out.println("SrComMypageController detail Start...");
			CommResMemBook mem = scms.userdetail(commResMemBook, isResume);
			System.out.println("----------------------------------------");
			System.out.println("SrComMypageController mem.getUser_name()->" + mem.getUser_name());
			System.out.println("SrComMypageController mem.getUser_email()->" + mem.getUser_email());
			System.out.println("SrComMypageController mem.getUser_tel()->" + mem.getUser_tel());
			System.out.println("SrComMypageController mem.getUser_addr()->" + mem.getUser_addr());
			System.out.println("SrComMypageController jobtag.getComm_ctx()->" + mem.getJobTag());
			System.out.println("SrComMypageController hsmjr.getComm_ctx()" + mem.getHsMjr());
			System.out.println("SrComMypageController restag1.getComm_ctx()" + mem.getTag1());
			System.out.println("SrComMypageController restag2.getComm_ctx()" + mem.getTag2());
			System.out.println("SrComMypageController restag3.getComm_ctx()" + mem.getTag3());
			System.out.println("----------------------------------------");
			
			//---------------------------------------------------------------------

			// 북마크 유무
			Bookmark bookmark = new Bookmark();
			bookmark.setCom_id(com_id);
			bookmark.setUser_id(user_id);
			int itbookmark = scms.bookmarkgetinfo(bookmark);
			System.out.println("Controller itbookmark->" + itbookmark);
			
			//---------------------------------------------------------------------
			
			// company
			CommCompany commCompany1 = null;
			commCompany1 = scms.comInfo(commCompany);
			
			//---------------------------------------------------------------------
			
			model.addAttribute("itbookmark", itbookmark);
			model.addAttribute("mem", mem);
			model.addAttribute("com_id", com_id);
			model.addAttribute("user_id", user_id);
			model.addAttribute("commCompany", commCompany);

			return "sr/comMarkMemDetail";
		}

	// 북마크
	@RequestMapping(value = "bookmark", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String bookmark(String com_id, String user_id, int it_bookmark, Model model) {
		System.out.println("SrComMypageController bookmark Start...");

		Bookmark bookmark = new Bookmark();
		bookmark.setCom_id(com_id);
		bookmark.setUser_id(user_id);

		System.out.println("SrComMypageController bookmark com_id->" + com_id);
		System.out.println("SrComMypageController bookmark user_id->" + user_id);
		System.out.println("SrComMypageController bookmark it_bookmark->" + it_bookmark);

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

	@GetMapping(value = "resumeDetail")
	public String resumeDetail(ResumeContect resumeContect, Model model) {
		insertResumeContect(resumeContect);
		resumeContect = scms.findRC(resumeContect);

		model.addAttribute("resumeContect", resumeContect);

		return "sr/resumeDetail";
	}

	// 이력서 조회시 이력서열람 INSERT
	public int insertResumeContect(ResumeContect resumeContect) {

		int result = 0;
		// 열람기록 존재하는지~ 없으면 null~
		ResumeContect rc = scms.findRC(resumeContect);

		// 없으면 인서트할게요~
		if (rc == null) {
			result = scms.insertResumeContect(resumeContect);
			// 인서트 확인~성공시 1 성공했으면 알림 추가할게요~
			if (result == 1) {
				// 알ㄹ
				rc = scms.findRC(resumeContect);
				Notice notice = new Notice();
				notice.setUser_id(rc.getUser_id());
				notice.setNtc_ctg("003");
				notice.setNtc_code(rc.getNtc_code());
				scms.insertNotice(notice);

			}
		}
		return result;
	}
	
}
