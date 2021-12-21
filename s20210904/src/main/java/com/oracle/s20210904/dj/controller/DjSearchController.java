package com.oracle.s20210904.dj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.dj.model.DjSearch;
import com.oracle.s20210904.dj.service.DjSearchService;

@Controller
public class DjSearchController {

	private static final Logger logger = LoggerFactory.getLogger(DjSearchController.class);
	
	@Autowired
	private DjSearchService dss;
	//작성계획
	//검색창에서 여기로 문자열을 받아온다. 검색어가 입력된 상태로 '검색'버튼을 누르면 해당 문자열과 함께 컨트롤러가 실행된다.
	//조인되어서 가지고 온 데이터를 분해하여서 각자의 모델에 담는다. 
	//기업 검색 사항은 기업 탭 누를 시 ajax에 의해서 해당 부분이 출력된다.
	//공고 검색 사항은 공고 탭 누를 시 ajax에 의해서 해당 부분이 출력된다.(default)
	
	//임시 페이지 
	
	@RequestMapping(value="/mapStart")
	public String mapStart() {
		
		
		
		return "dj/djMaps";
	}
	
	
	@PostMapping(value="/search" )
	public String mainSearch(DjSearch scContent,String currentPage,DjSearch djsearch,Company company,Model model,String mainsearch) {
		System.out.println("DjSearchController의 mainSearch() 실행되었습니다.");
		
		System.out.println("처음 컨트롤러에 들어올 때 mainsearch의 내용?->"+mainsearch);

		String mainsearch1 = mainsearch.replaceAll("\\s+","");
		
		System.out.println("변환한 mainsearch의 값->"+mainsearch1);
		//여기까지 검색어 띄어쓰기 처리
		System.out.println("-------------------------------------------");

		
		djsearch.setMainsearch(mainsearch1);
		djsearch.setStart(1);//스타트1
		djsearch.setEnd(999);// 끝 10
		
		
		System.out.println("---공고 검색 시작---");
		//검색어를 이용한 공고 결과	DjSearch djsearch
		List<DjSearch> annoResult = dss.searchAnno(djsearch);
		model.addAttribute("annoResult", annoResult);
		model.addAttribute("mainsearch1", mainsearch1);
		System.out.println("---공고 갯수 확인 시작---");
		int annocnt = dss.annocnt(djsearch);
		System.out.println("검색된 공고 개수:"+annocnt);
		model.addAttribute("annocnt", annocnt);
		
		System.out.println("---회사 검색 시작---");
		//검색어를 이용한 회사 결과
		company.setMainsearch(mainsearch1);//변경한 검색어 주입
		company.setStart(1); //스타트1
		company.setEnd(999); // 끝 10
		List<Company> comResult = dss.searchCom(company); 
		model.addAttribute("comResult", comResult);
		System.out.println("---공고 갯수 확인 시작---");
		int comcnt = dss.comcnt(company);
		System.out.println("검색된 회사 개수:"+comcnt);
		model.addAttribute("comcnt", comcnt);
System.out.println("--------------------------------------");
		
	
		return "dj/mainsearchtap";
	}
	
	
	
}
