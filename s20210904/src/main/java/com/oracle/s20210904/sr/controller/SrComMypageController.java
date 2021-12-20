package com.oracle.s20210904.sr.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.ComAnnounce;
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
import com.oracle.s20210904.wk.model.WkCommDto;

@Controller
public class SrComMypageController {

	@Autowired
	private SrComMypageService scms;

	private String checkId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String cid = (String) session.getAttribute("id");
		if (cid == null || cid.equals("")) {
			return "session_none";
		}
		return cid;
	}

	// 기업정보
	@GetMapping(value = "ComInfo")
	public String ComInfo(HttpServletRequest request, Model model, CommCompany commCompany, String com_id) {

		System.out.println("SrComMypageController ComInfo START...");
		
		// 경우에 따라 리턴 할 객체
		String returnString = null;
		String sessionCheck = "session_none";
		// 세션 처리
		String cid = checkId(request);
		System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

		if (cid.equals(sessionCheck)) {
			System.out.println("실행 완료");
		} else if (cid != null) {
			returnString = "sr/ComInfo";
		}
		
		commCompany.setCom_id(cid);

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);

		model.addAttribute("commCompany1", commCompany1);

		return "sr/comInfoMenu";
	}

	// 채용공고
	@GetMapping(value = "ComAnn")
	public String ComAnn(HttpServletRequest request, CommCompany commCompany, Model model, Announce announce, String currentPage) {

//		String com_id="tlstprp5184";
//		announce.setCom_id(com_id);
		
		System.out.println("SrComMypageController ComAnn START...");
		
		// 경우에 따라 리턴 할 객체
				String returnString = null;
				String sessionCheck = "session_none";
				// 세션 처리
				String cid = checkId(request);
				System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

				if (cid.equals(sessionCheck)) {
					System.out.println("실행 완료");
				} else if (cid != null) {
					returnString = "sr/ComAnn";
				}

		commCompany.setCom_id(cid);
		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		
		announce.setCom_id(cid);

		// announce list : id=0일 때 진행 중 공고, id=1일 때 마감 공고
		List<Announce> listAnn = scms.listAnn(announce);
//		if (id != null) {
//			if (id.equals("0")) {
//				listAnn = scms.listAnnReg(announce);
//				System.out.println("bnt1");
//				System.out.println("SrComMypageController listAnn listAnnReg size=>" + listAnn.size());
//
//			} else {
//				listAnn = scms.listAnnCReg(announce);
//				System.out.println("bnt2");
//				System.out.println("SrComMypageController listAnn listAnnCReg size=>" + listAnn.size());
//
//			}
//		}
		
		// paging
//		if (currentPage == null) {
//			currentPage = "1";
//		}
//		System.out.println("채용 공고 페이징 처리");
//		int total = listAnn.size();
//		System.out.println("listAnn.size()의 값은?=>" + total);
//		Paging pg = new Paging(total, currentPage);
//		model.addAttribute("pg", pg);
//		System.out.println("-------pg내용물확인---------");
//		System.out.println("" + pg.getCurrentPage());
//		System.out.println("" + pg.getEnd());
//		System.out.println("" + pg.getEndPage());
//		System.out.println("" + pg.getPageBlock());
//		System.out.println("" + pg.getRowPage());
//		System.out.println("" + pg.getStart());
//		System.out.println("" + pg.getStartPage());
//		System.out.println("" + pg.getTotal());
//		System.out.println("" + pg.getTotalPage());
//		System.out.println("-------pg내용물확인--끝-------");
//				announce.setStart(pg.getStart()); // 1
//				announce.setEnd(pg.getEnd()); // 5

		// ----------------------------------------------------------------------------

//		System.out.println("SrComMypageController ComAnn total=>" + total);
		for(Announce aaa:listAnn) {
			System.out.println("------------------------------");
			System.out.println("컨트로러러러럴"+aaa.getAnno_code());
			System.out.println("컨트로러러러럴"+aaa.getAnno_title());
			System.out.println("컨트로러러러럴"+aaa.getCom_bus());
			System.out.println("------------------------------");
		}
		
		// ----------------------------------------------------------------------------

//		model.addAttribute("total", total);
//		model.addAttribute("pg", pg);
//		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("listAnn", listAnn);

		return "sr/comAnnMenu";
	}

	// 회원검색
	@RequestMapping(value = "ComMemSearch")
	public String ComMemberSearch1() {

		System.out.println("SrComMypageController ComMemberSearch START...");

		return "sr/comMemberSearchMenu";
	}

	@GetMapping(value = "SrSearch")
	public String ComMemberSearch(HttpServletRequest request,Model model, String currentPage, MemResumeBmark memResumeBmark,
			CommCompany commCompany, String keyword) {

		// 경우에 따라 리턴 할 객체
				String returnString = null;
				String sessionCheck = "session_none";
				// 세션 처리
				String cid = checkId(request);
				System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

				if (cid.equals(sessionCheck)) {
					System.out.println("실행 완료");
				} else if (cid != null) {
					returnString = "sr/SrSearch";
				}
	

		System.out.println("SrComMypageController SrSearch START...");
		System.out.println("처음 컨트롤러에 들어올 때 keyword의 내용?=>" + keyword);

		// 공백처리
		String keyword1 = keyword.replaceAll("\\s+", "");

		System.out.println("변환한 keyword의 값->" + keyword1);

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		
		memResumeBmark.setCom_id(cid);

		// keyword를 이용한 검색 내용
		System.out.println("SrComMypageController memResumeBmarkList STRAT...");
		
		List<MemResumeBmark> memResumeBmarkList = scms.memResumeBmarkList(keyword1);

		System.out.println("List<MemResumeBmark>의 size?->" + memResumeBmarkList.size());

		for (MemResumeBmark memResumeBmarkList1 : memResumeBmarkList) {
			System.out.println("---------bookmarkList Start -------------");
			System.out.println("memResumeBmarkList1.getRes_title()-> " + memResumeBmarkList1.getRes_title());
			System.out.println("memResumeBmarkList1.getMrk_res_code()-> " + memResumeBmarkList1.getMrk_res_code());
			System.out.println("----------bookmarkList End------------------");
		}

		// paging
		if (currentPage == null) {
			currentPage = "1";
		}
		System.out.println("채용 공고 페이징 처리");
		int total = memResumeBmarkList.size();
		System.out.println("listAnn.size()의 값은?=>" + total);
		Paging pg = new Paging(total, currentPage);
		model.addAttribute("pg", pg);
		System.out.println("-------pg내용물확인---------");
		System.out.println("" + pg.getCurrentPage());
		System.out.println("" + pg.getEnd());
		System.out.println("" + pg.getEndPage());
		System.out.println("" + pg.getPageBlock());
		System.out.println("" + pg.getRowPage());
		System.out.println("" + pg.getStart());
		System.out.println("" + pg.getStartPage());
		System.out.println("" + pg.getTotal());
		System.out.println("" + pg.getTotalPage());
		System.out.println("-------pg내용물확인--끝-------");

		model.addAttribute("memResumeBmarkList", memResumeBmarkList); // 검색한 내용
		model.addAttribute("keyword1", keyword1);// 검색 키워드
		model.addAttribute("commCompany1", commCompany1);
		
		String com_id="tlstprp5184";
		model.addAttribute("com_id", com_id);

		return "sr/comMemberSearchMenuDetail";

	}

	// 북마크 List
	@GetMapping(value = "bookmarkList")
	public String bookmarkList(HttpServletRequest request, String currentPage, MemBmark memBmark, Model model,
			CommCompany commCompany, MemResumeBmark memResumeBmark) {

		
		// 경우에 따라 리턴 할 객체
		String returnString = null;
		String sessionCheck = "session_none";
		// 세션 처리
		String cid = checkId(request);
		System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

		if (cid.equals(sessionCheck)) {
			System.out.println("실행 완료");
		} else if (cid != null) {
			returnString = "sr/bookmarkList";
		}
		

		System.out.println("SrComMypageController bookmarkList START...");
		System.out.println("memBmark내용물->memBmark.getCom_id()" + memResumeBmark.getCom_id());
		System.out.println("memBmark내용물->memBmark.getStart()" + memResumeBmark.getStart());
		System.out.println("memBmark내용물->memBmark.getEnd()" + memResumeBmark.getEnd());

		memResumeBmark.setCom_id(cid);

		List<MemResumeBmark> bookmarkList = scms.bookmarkList(memResumeBmark);

		System.out.println("SrComMypageController bookmarkList.size()->" + bookmarkList.size());
		System.out.println("---------------------------------------------------------------");
		for (MemResumeBmark MemBmark : bookmarkList) {
			System.out.println("SrComMypageController MemBmark.getUser_id()-> " + MemBmark.getUser_id());
			System.out.println("SrComMypageController MemBmark.getCom_id()->" + MemBmark.getCom_id());
			System.out.println("SrComMypageController MemBmark.getIt_bookmark()->" + MemBmark.getIt_bookmark());
			System.out.println("SrComMypageController MemBmark.getMrk_date()-> " + MemBmark.getMrk_date());
			System.out.println("SrComMypageController MemBmark.getMrk_res_code())-> " + MemBmark.getMrk_res_code());
		}
		System.out.println("---------------------------------------------------------------");

		// paging
		if (currentPage == null) {
			currentPage = "1";
		}
		System.out.println("북마크리스트 페이징 처리");
		int total = bookmarkList.size();
		System.out.println("bookmarkList.size()의 값은?=>" + total);
		Paging pg = new Paging(total, currentPage);
		model.addAttribute("pg", pg);
		System.out.println("-------pg내용물확인---------");
		System.out.println("" + pg.getCurrentPage());
		System.out.println("" + pg.getEnd());
		System.out.println("" + pg.getEndPage());
		System.out.println("" + pg.getPageBlock());
		System.out.println("" + pg.getRowPage());
		System.out.println("" + pg.getStart());
		System.out.println("" + pg.getStartPage());
		System.out.println("" + pg.getTotal());
		System.out.println("" + pg.getTotalPage());
		System.out.println("-------pg내용물확인--끝-------");

		model.addAttribute("total", total);
		model.addAttribute("bookmarkList", bookmarkList);
		model.addAttribute("pg", pg);

		return "sr/comMarkMemberMenu";

	}

	@GetMapping(value="noticeDel")
	public String noticeDel(String ntc_code) {
		scms.noticeDel(ntc_code);
		
		return "redirect:ComAppStatus";
	}
	
	// 지원현황 list
	@GetMapping(value = "ComAppStatus")
	public String ComAppStatus(Model model, AppAnnMem appAnnMem, CommCompany commCompany, HttpServletRequest request,
			String currentPage/* , Bookmark bookmark */) {
				
				
//		String comid = (String) request.getSession().getAttribute("id");
		
		
		
		// 경우에 따라 리턴 할 객체
				String returnString = null;
				String sessionCheck = "session_none";
				// 세션 처리
				String cid = checkId(request);
				System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

				if (cid.equals(sessionCheck)) {
					System.out.println("실행 완료");
				} else if (cid != null) {
					returnString = "sr/ComAppStatus";
				}
				
				
		appAnnMem.setCom_id(cid);
				
		System.out.println("SrComMypageController ComAppStatus START...");

		// ----------------------------------------------------------------------------
		// company img 보여주기용
		CommCompany commCompany1 = scms.comInfo(commCompany);

		// 공고리스트 뿌려줄거
		List<Announce> annoList = scms.AnnounceList(cid);
		// 처음들어왔을때 디폴트값
		if (appAnnMem.getAnno_code() == null) {
			appAnnMem.setAnno_code(annoList.get(0).getAnno_code());
		}
		model.addAttribute("annoList", annoList);

		// ----------------------------------------------------------------------------
		// apply+member+announce JOIN list
		
		int applyTotCnt = scms.applyTotCnt(appAnnMem.getAnno_code());
		Paging pg = new Paging(applyTotCnt, currentPage);
		appAnnMem.setStart(pg.getStart());
		appAnnMem.setEnd(pg.getEnd());
		
//		bookmark.setCom_id(comid);
		List<AppAnnMem> appAnnMember = scms.appAnnMemReg(appAnnMem);
//		Bookmark bookmark1=scms.bookmark(bookmark);
//		model.addAttribute("bookmark1", bookmark1);
		

		// ----------------------------------------------------------------------------
		System.out.println("SrComMypageController ComAppStatus company1=>" + commCompany1);
		System.out.println("SrComMypageController ComAppStatus appAnnMember=>" + appAnnMember);

		// ----------------------------------------------------------------------------
		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("appAnnMember", appAnnMember);

		return "sr/comAppStatusMenu";
	}

	// 지원현황+북마크 상세(이력서 포함)
	@GetMapping(value = "detail2")
	public String detail(String user_id, String com_id, Integer mrk_res_code, Integer isResume, String anno_code,
			CommMemResume commMemResume, Model model, CommResMemBook commResMemBook
			, CommCompany commCompany) {
		
		System.out.println("SrComMypageController detail2 Start...");
		
		//최초 조회시 알림갑니다-----------------------
		ResumeContect rc = new ResumeContect();
		rc.setCom_id(com_id);
		rc.setUser_id(user_id);
		rc.setRes_code(mrk_res_code);
		rc.setAnno_code(anno_code);
		insertResumeContect(rc);
		//-------------------------------------
		

		// company+comm JOIN
				CommCompany commCompany1 = null;
				commCompany1 = scms.comInfo(commCompany);

		System.out.println("1.SrComMypageController detail2 Start...");

		System.out.println("2.뷰에서 넘어온 com_id=>" + com_id);
		System.out.println("2.뷰에서 넘어온 user_id=>" + user_id);
		System.out.println("2.뷰에서 넘어온 mrk_res_code=>" + mrk_res_code);

		// comm+resume+member+bookmark JOIN
		CommResMemBook mem = scms.userdetail(commResMemBook, isResume);
		System.out.println("----------------------------------------");

		System.out.println("6.SrComMypageController mem.getUser_name()->" + mem.getUser_name());
		System.out.println("6.SrComMypageController mem.getUser_email()->" + mem.getUser_email());
		System.out.println("6.SrComMypageController mem.getUser_tel()->" + mem.getUser_tel());
		System.out.println("6.SrComMypageController mem.getUser_addr()->" + mem.getUser_addr());
		System.out.println("6.SrComMypageController jobtag.getComm_ctx()->" + mem.getJobTag());
		System.out.println("6.SrComMypageController hsmjr.getComm_ctx()" + mem.getHsMjr());
		System.out.println("6.SrComMypageController restag1.getComm_ctx()" + mem.getTag1());
		System.out.println("6.SrComMypageController restag2.getComm_ctx()" + mem.getTag2());
		System.out.println("6.SrComMypageController restag3.getComm_ctx()" + mem.getTag3());
		System.out.println("6.SrComMypageController restag3.getComm_ctx()" + mem.getUniv_mjr());
		System.out.println("----------------------------------------");

		// 북마크 유무
		Bookmark bookmark = new Bookmark();
		bookmark.setCom_id(com_id);
		bookmark.setUser_id(user_id);
		bookmark.setMrk_res_code(mrk_res_code);
		int itbookmark = scms.bookmarkgetinfo(bookmark);
		System.out.println("11.Controller itbookmark->" + itbookmark);

		model.addAttribute("itbookmark", itbookmark);
		System.out.println("12.itbookmark->"+bookmark.getIt_bookmark());
		model.addAttribute("mem", mem);
		model.addAttribute("com_id", com_id);
		model.addAttribute("user_id", user_id);
		model.addAttribute("mrk_res_code", mrk_res_code);
		model.addAttribute("commCompany", commCompany);

		return "sr/comMarkMemDetail";
	}

	// 북마크하기
	@GetMapping(value = "bookmark")/* , produces = "application/text;charset=UTF-8" )*/
	@ResponseBody
	public Bookmark bookmark(String com_id, String user_id, int it_bookmark, int mrk_res_code,Model model,Bookmark bookmark) {

		System.out.println("SrComMypageController bookmark Start...");

//		Bookmark bookmark = null;
		bookmark.setCom_id(com_id);
		bookmark.setUser_id(user_id);
		bookmark.setMrk_res_code(mrk_res_code);
//		bookmark.setIt_bookmark(it_bookmark);
		
		System.out.println("SrComMypageController bookmark com_id->" + com_id);
		System.out.println("SrComMypageController bookmark user_id->" + user_id);
		System.out.println("SrComMypageController bookmark it_bookmark->" + it_bookmark);
		System.out.println("SrComMypageController bookmark mrk_res_code->" + mrk_res_code);

		/* int check = as.likecnt(scrap); */
//		String imgSrc = null; // ajax로 리턴 될 놈 ex)img에 들어갈 src

		if (it_bookmark == 0) { // 스크랩하기
			System.out.println("Controller 북마크 시작 ...");
			scms.bookmarkinsert(bookmark);
			System.out.println("Controller 모냐고오오오오 왜 북마크 안되냐고..=>"+bookmark.getUser_id());
			System.out.println("Controller 모냐고오오오오 왜 북마크 안되냐고..=>"+bookmark.getMrk_res_code());
			System.out.println("Controller 모냐고오오오오 왜 북마크 안되냐고..=>"+bookmark.getIt_bookmark());
			System.out.println("Controller 모냐고오오오오 왜 북마크 안되냐고..=>"+bookmark.getCom_id());
			System.out.println("북마크하기IMGSRC");
			bookmark=scms.bookmark(bookmark);
			System.out.println("북마크 데이터 확인=>"+bookmark.getIt_bookmark());
//			imgSrc = "북마크하기IMGSRC";
		} else if (it_bookmark == 1) { // 스크랩취소
			System.out.println("Controller 북마크취소 시작 ...");
			scms.bookmarkdelete(bookmark);
			System.out.println("북마크취소IMGSRC");
			bookmark.setIt_bookmark(0);
//			imgSrc = "북마크취소IMGSRC";
		}
		

//		return imgSrc;
		return bookmark;

	}

	@GetMapping(value = "resumeDetail")
	public String resumeDetail(ResumeContect resumeContect, Model model) {

		System.out.println("SrComMypageController resumeDetail Start...");

		insertResumeContect(resumeContect);
		resumeContect = scms.findRC(resumeContect);

		model.addAttribute("resumeContect", resumeContect);

		return "sr/resumeDetail";
	}

	// 이력서 조회시 이력서열람 INSERT
	public int insertResumeContect(ResumeContect resumeContect) {

		System.out.println("SrComMypageController insertResumeContect Start...");

		int result = 0;
		// 열람기록 존재하는지~ 없으면 null~
		ResumeContect rc = scms.findRC(resumeContect);

		// 없으면 인서트할게요~
		if (rc == null) {
			result = scms.insertResumeContect(resumeContect);
			System.out.println(result);
			// 인서트 확인~성공시 1 성공했으면 알림 추가할게요~
			if (result == 1) {
				System.out.println("알림드가유~");
				rc = scms.findRC(resumeContect);
				rc.setAnno_code(resumeContect.getAnno_code());
				Notice notice = new Notice();
				notice.setUser_id(rc.getUser_id());
				notice.setNtc_ctg("003");
				notice.setNtc_code(rc.getNtc_code());
				notice.setAnno_code(rc.getAnno_code());
				scms.insertNotice(notice);

			}
		}
		return result;
	}

	@GetMapping(value = "memFail")
	public String memFail(Apply apply) {
		scms.memFail(apply);
		scms.applyStsUpdate(apply);
		return "redirect:ComAppStatus";
	}

	@GetMapping(value = "memPass")
	public String memPass(Apply apply) {
		scms.memPass(apply);
		scms.applyStsUpdate(apply);
		return "redirect:ComAppStatus";
	}
	
	
	
//	
//	@RequestMapping(value = "SrAnnoList")
//	public String GmAnnoList(HttpServletRequest request, ComAnnounce comAnnounce, String currentPage, Model model) {
//		System.out.println("GmAnnoListController Start List...");
//		
//		/* 2021-12-15 11:33 대성 머지 오류났는데 지우면 안될거같아서 남겨둠;;
//		//원본토탈
//		//int total = as.total();
//		
//		int total = 0;
//		//띄어쓰기 제거
//		if(annosearch!=null) {
//			System.out.println("annosearch->"+annosearch);
//			String annosearch1 = annosearch.replaceAll("\\s+","");
//			total = as.searchtotal(annosearch1);
//			System.out.println("변환된 annosearch1 내용->"+annosearch1);
//			System.out.println("검색어 있을 때의 total->"+total);	
//			comAnnounce.setAnnosearch(annosearch1);
//			model.addAttribute("annosearch1", annosearch1);
//		} else if (annosearch==null) {
//			total = as.total();
//			System.out.println("검색어 없을 때의 total->"+total);
//		}
//		*/
//		
//		// 경우에 따라 리턴 할 객체
//				String returnString = null;
//				String sessionCheck = "session_none";
//				// 세션 처리
//				String cid = checkId(request);
//				System.out.println("세션 잘 갖고 오는지 확인=>" + cid);
//
//				if (cid.equals(sessionCheck)) {
//					System.out.println("실행 완료");
//				} else if (cid != null) {
//					returnString = "sr/bookmarkList";
//				}
//		
//		int total = scms.total();
//		System.out.println("GmAnnoList total->"+total);
//		System.out.println("----------------------------------");
//		
//		// Paging
//		Paging pg = new Paging(total, currentPage);
//		comAnnounce.setStart(pg.getStart()); // 1 
//		comAnnounce.setEnd(pg.getEnd()); // 5
//		
//		System.out.println("GmAnnoListController GmAnnoList Start...");
//		List<ComAnnounce> listAnno = scms.listAnno(comAnnounce); // (Paging이 포함된) Announcr 파라미터 가지고 service 단으로 이동
//		
//		System.out.println("GmAnnoListController GmAnnoList listAnno.size->"+listAnno.size());
//		System.out.println("---------------------------------------------------------------");
//		for(ComAnnounce comanno : listAnno) {
//			System.out.println("---------GmAnnoList Start -------------");
//			System.out.println("comanno.getCom_name()-> "+comanno.getCom_name());
//			System.out.println("comanno.getCom_id()->"+comanno.getCom_id());
//			System.out.println("comanno.getAnno_code()->"+comanno.getAnno_code());
//			System.out.println("comanno.getAnno_title()-> "+comanno.getAnno_title());
//			System.out.println("----------GmAnnoList End------------------");
//			
//		}
//		
//		model.addAttribute("total", total);
//		model.addAttribute("listAnno", listAnno);
//		model.addAttribute("pg", pg);
//		System.out.println("저장됨");
//		
//		return "gm/GmAnnoList";
//		
//	}
	
	
	// 마이페이지 수정(비밀번호 확인 입력페이지로)d
		@RequestMapping(value = "ComMypageUpdate")
		public String mbMypageUpdate(HttpServletRequest request, Model model) {
			System.out.println("comMypageController comMypageUpdate()");
			String comid=checkId(request);
			model.addAttribute("comid", comid);
			return "/sr/comMypageUpdatePwCheck"; 
		}
		
		// 마이페이지 수정(수정정보 입력페이지)
		@PostMapping(value = "comMypageUpdateForm")
		public String comMypageUpdateForm(HttpServletRequest request, Model model, CommCompany commCompany){
			
			System.out.println("comMypageController comMypageUpdateForm()");
			// 경우에 따라 리턴 할 객체
			String returnString = null;
			String sessionCheck = "session_none";
			// 세션 처리
			String cid = checkId(request);
			System.out.println("세션 잘 갖고 오는지 확인=>" + cid);

			if (cid.equals(sessionCheck)) {
				System.out.println("실행 완료");
			} else if (cid != null) {
				returnString = "sr/ComInfo";
			}
			
			commCompany.setCom_id(cid);
			
			String returnpage=null;
			
			String com_pw=commCompany.getCom_pw();
			CommCompany commCompany1=scms.comInfo(commCompany);
			
//			String main_cat="061";
//			List<WkCommDto> commlist=scms.commList(main_cat);
//			model.addAttribute("user_edu_commlist", commlist);
			
			if(com_pw.equals(commCompany1.getCom_pw())) {
				model.addAttribute("commCompany1", commCompany1);
				returnpage="/sr/comMypageUpdateForm";
			}else {
				String msg="잘못된 비밀번호입니다";
				model.addAttribute("msg", msg);
				returnpage="/sr/comMypageUpdatePwCheck";
			}
			
			return returnpage; 
		}
	
	// 마이페이지 수정 db작동
//	@PostMapping(value = "comMypageUpdate")
//	public String mbMypageUpdatePro(Member member, HttpServletRequest request, Model model, String user_img) {
//		System.out.println("WkMbMypageController mbMypageUpdatePro()");
//		String mbid=checkId(request);
//		model.addAttribute("mbid", mbid);
//		System.out.println("WkMbMypageController mbMypageUpdatePro() user_img : "+user_img);
////		Member member2=member;
//		System.out.println("WkMbMypageController mbMypageUpdatePro() member : "+member.getUser_img());
//		
//		int mypage_update_result=scms.memberUpdate(member);
//		String mypage_update_msg=null;
//		System.out.println("WkMbMypageController mbMypageUpdatePro() mypage_update_result : "+mypage_update_result);
//		if(mypage_update_result>=1) {
//			mypage_update_msg="마이페이지 수정 완료";
//		}else {
//			mypage_update_msg="마이페이지 수정 실패";
//		}
//		model.addAttribute("mypage_update_msg", mypage_update_msg);
//		return "forward:mbMypage";
//	}
}
