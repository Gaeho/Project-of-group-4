package com.oracle.s20210904.sr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.MemBmark;
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

	private String checkId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String cid = (String) session.getAttribute("cmid");
		if (cid == null || cid.equals("")) {
			return "session_none";
		}
		return cid;
	}

	// 기업정보
	@GetMapping(value = "ComInfo")
	public String ComInfo(HttpServletRequest request, Model model, CommCompany commCompany, String com_id) {

		System.out.println("SrComMypageController ComInfo START...");

		String comid = checkId(request);
		model.addAttribute("comid", comid);

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);

		model.addAttribute("commCompany1", commCompany1);

		return "sr/comInfoMenu";
	}

	// 채용공고
	@GetMapping(value = "ComAnn")
	public String ComAnn(CommCompany commCompany, Model model, Announce announce, String currentPage, String id) {

		System.out.println("SrComMypageController ComAnn START...");

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);

		// announce list : id=0일 때 진행 중 공고, id=1일 때 마감 공고
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

		// paging
		if (currentPage == null) {
			currentPage = "1";
		}
		System.out.println("채용 공고 페이징 처리");
		int total = listAnn.size();
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
//				announce.setStart(pg.getStart()); // 1
//				announce.setEnd(pg.getEnd()); // 5

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

		System.out.println("SrComMypageController ComMemberSearch START...");

		return "sr/comMemberSearchMenu";
	}

	@GetMapping(value = "SrSearch")
	public String ComMemberSearch(Model model, String currentPage, MemResumeBmark memResumeBmark,
			CommCompany commCompany, String keyword) {

		String com_id = "tlstprp5184";

		System.out.println("SrComMypageController SrSearch START...");
		System.out.println("처음 컨트롤러에 들어올 때 keyword의 내용?=>" + keyword);

		// 공백처리
		String keyword1 = keyword.replaceAll("\\s+", "");

		System.out.println("변환한 keyword의 값->" + keyword1);

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);

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
		model.addAttribute("com_id", com_id);

		return "sr/comMemberSearchMenuDetail";

	}

	// 북마크 List
	@GetMapping(value = "bookmarkList")
	public String bookmarkList(HttpServletRequest request, String currentPage, MemBmark memBmark, Model model,
			CommCompany commCompany) {

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
		System.out.println("memBmark내용물->memBmark.getCom_id()" + memBmark.getCom_id());
		System.out.println("memBmark내용물->memBmark.getStart()" + memBmark.getStart());
		System.out.println("memBmark내용물->memBmark.getEnd()" + memBmark.getEnd());

		memBmark.setCom_id(cid);

		List<MemBmark> bookmarkList = scms.bookmarkList(memBmark);

		System.out.println("SrComMypageController bookmarkList.size()->" + bookmarkList.size());
		System.out.println("---------------------------------------------------------------");
		for (MemBmark MemBmark : bookmarkList) {
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

	// 지원현황 list

	@GetMapping(value = "ComAppStatus")
	public String ComAppStatus(Model model, AppAnnMem appAnnMem, CommCompany commCompany, HttpServletRequest request,
			String currentPage) {
		String comid = (String) request.getSession().getAttribute("id");
		System.out.println("SrComMypageController ComAppStatus START...");

		// ----------------------------------------------------------------------------
		// company img 보여주기용
		CommCompany commCompany1 = scms.comInfo(commCompany);

		// 공고리스트 뿌려줄거
		List<Announce> annoList = scms.AnnounceList(comid);
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

		List<AppAnnMem> appAnnMember = scms.appAnnMemReg(appAnnMem);

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
			CommMemResume commMemResume, Model model, CommResMemBook commResMemBook, CommCompany commCompany) {

		System.out.println("SrComMypageController detail2 Start...");
		
		//최초 조회시 알림갑니다-----------------------
		ResumeContect rc = new ResumeContect();
		rc.setCom_id(com_id);
		rc.setUser_id(user_id);
		rc.setRes_code(mrk_res_code);
		rc.setAnno_code(anno_code);
		insertResumeContect(rc);
		//-------------------------------------
		
		System.out.println("뷰에서 넘어온 com_id=>" + com_id);
		System.out.println("뷰에서 넘어온 user_id=>" + user_id);
		System.out.println("뷰에서 넘어온 mrk_res_code=>" + mrk_res_code);

		// comm+resume+member+bookmark JOIN
		CommResMemBook mem = scms.userdetail(commResMemBook, isResume);
		System.out.println("----------------------------------------");
//		System.out.println("SrComMypageController mem.getUser_name()->" + mem.getUser_name());
//		System.out.println("SrComMypageController mem.getUser_email()->" + mem.getUser_email());
//		System.out.println("SrComMypageController mem.getUser_tel()->" + mem.getUser_tel());
//		System.out.println("SrComMypageController mem.getUser_addr()->" + mem.getUser_addr());
//		System.out.println("SrComMypageController jobtag.getComm_ctx()->" + mem.getJobTag());
//		System.out.println("SrComMypageController hsmjr.getComm_ctx()" + mem.getHsMjr());
//		System.out.println("SrComMypageController restag1.getComm_ctx()" + mem.getTag1());
//		System.out.println("SrComMypageController restag2.getComm_ctx()" + mem.getTag2());
//		System.out.println("SrComMypageController restag3.getComm_ctx()" + mem.getTag3());
		System.out.println("----------------------------------------");

		// 북마크 유무
		Bookmark bookmark = new Bookmark();
		bookmark.setCom_id(com_id);
		bookmark.setUser_id(user_id);
		int itbookmark = scms.bookmarkgetinfo(bookmark);
		System.out.println("Controller itbookmark->" + itbookmark);

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);

		model.addAttribute("itbookmark", itbookmark);
		model.addAttribute("mem", mem);
		model.addAttribute("com_id", com_id);
		model.addAttribute("user_id", user_id);
		model.addAttribute("commCompany", commCompany);

		return "sr/comMarkMemDetail";
	}

	// 북마크하기
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
}
