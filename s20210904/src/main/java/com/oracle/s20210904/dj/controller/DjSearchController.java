package com.oracle.s20210904.dj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

import com.oracle.s20210904.dj.model.DjSearch;
import com.oracle.s20210904.dj.service.DjSearchService;

@Controller
public class DjSearchController {

	private static final Logger logger = LoggerFactory.getLogger(DjSearchController.class);
	
	
	private DjSearchService dss;
	//작성계획
	//검색창에서 여기로 문자열을 받아온다. 검색어가 입력된 상태로 '검색'버튼을 누르면 해당 문자열과 함께 컨트롤러가 실행된다.
	//조인되어서 가지고 온 데이터를 분해하여서 각자의 모델에 담는다. 
	//기업 검색 사항은 기업 탭 누를 시 ajax에 의해서 해당 부분이 출력된다.
	//공고 검색 사항은 공고 탭 누를 시 ajax에 의해서 해당 부분이 출력된다.(default)
	
	//임시 페이지 
	
	@RequestMapping(value="/searchStart")
	public String searchStart() {
		
		
		
		return "dj/djSearch";
	}
	
	
	@RequestMapping(value="/search")
	public String mainSearch(DjSearch scContent,Model model) {
		System.out.println("DjSearchController의 mainSearch() 실행되었습니다.");
		
		System.out.println("scContent의 scContent내용->"+scContent.getMainsearch());
		
		//띄어쓰기를 모두 제거한 뒤에 다시 저장함
		scContent.setMainsearch(scContent.getMainsearch().replaceAll("\\s+",""));
		
		System.out.println("변환한 뒤의 scContent의 scContent내용->"+scContent.getMainsearch());
		
		List<DjSearch> result = dss.searchSome(scContent);
		
		if(result != null) {
			System.out.println("컨트롤러로 되돌아왔다! 성공한듯하다!!!!");
		} else if (result == null) {
			System.out.println("컨트롤러 돌아왔긴했는데..에잉 실패");
		}
		
		
		//return "searchResponse";
		return "";
	}
	
	
	
}
