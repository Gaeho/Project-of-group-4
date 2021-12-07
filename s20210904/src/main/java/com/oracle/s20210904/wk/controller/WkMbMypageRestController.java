package com.oracle.s20210904.wk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.wk.service.WkMbMypageService;

@RestController
public class WkMbMypageRestController {

	private final WkMbMypageService ms;
	@Autowired
	public WkMbMypageRestController(WkMbMypageService ms) {
		super();
		this.ms = ms;
	}
	
	private String checkId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mbid");
		if(id==null || id.equals("")){              
			return "/wk/wkindex";
		}
		return id;
	}
	
	
	
	
	@RequestMapping(value = "mbMypageResumeDelete", produces = "application/text;charset=UTF-8")
	public String mbMypageResumeDelete(HttpServletRequest request, int res_code) {
		System.out.println("WkMbMypageRestController mbMypageResumeDelete()");
		String mbid=checkId(request);
//		model.addAttribute("mbid", mbid);
		Resume resume=new Resume();
		resume.setUser_id(mbid);
		resume.setRes_code(res_code);
		
		System.out.println("test mbid, res_code : "+mbid+" : "+res_code);
		int result=ms.resumeDelete(resume);
		
		return Integer.toString(result); 
	}
	
	@GetMapping(value="mbMypageImguploadForm", produces = "application/text; charset=UTF-8")
	public String mbMypageImguploadForm(HttpServletRequest request,Model model, MultipartFile file1) {
		System.out.println("WkMbMypageRestController mbMypageImguploadForm()");
		String mbid=checkId(request);
		
		String uploadinDB = null;
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/wk/");
		System.out.println("생성 시 uploadPath->"+uploadPath);
		//업로드 경로를 만든다. 메타데이터 아래에 경로를 둔다. 가장 아래에 upload라는 폴더를 만들고 거기에 파일을 둔다.

		System.out.println("uploadForm 시작되었습니다.");
		
		System.out.println("originalName: "+file1.getOriginalFilename());//사진의 원래 이름을 보여준다
		
		System.out.println("size: " + file1.getSize());//사진의 용량
		System.out.println("contentType: " + file1.getContentType());//사진의 타입
		System.out.println("uploadPath: " + file1); //업로드 경로
		
		//검증. 만약에 이미 db에 올려져 있는 자료가 있다 -> 가져온 값이 Null->아래 과정 정상 진행하기
		//								 -> 가져온 값이 있다 -> 삭제 진행 후 진행하기	왜냐면 그게 이미 물리 폴더에 있을테니까 삭제하고 새로 넣는 식으로 구현함
		// 이 짓을 왜 하나?-> 이것을 안하면 /upload/폴더에 물리적으로 파일이 계속 쌓임
	
		String IsitNull = null;
		IsitNull = das.nullconfirm(comId1);
		System.out.println("(컨트롤러) 이미지가 Null인지 확인합니다.->"+IsitNull);
		//널이 아니고 값을 가져왔다면 해당 이미지의 이름(경로)일 것이다.
		
		//이를 통해서 업로드 시에는 null인 
		if(IsitNull == null) {
			 //(여기부터 본격 업로드 시작)
														
			uploadinDB = uploadFile(file1.getOriginalFilename(),file1.getBytes(),uploadPath,comId1);
			logger.info("uploadinDB: "+uploadinDB);
			
			// model.addAttribute("savedName", savedName);
			//model.addAttribute("comId1", comId1);
			
			
		} else if (IsitNull != null) {
			//검사했는데 널이 아니면 delete 메서드를 호출해서 삭제를 진행한다.
			
			String return1 = null;
			// id가 comId1인 곳의 이미지를 삭제하겠다.->db를 null로 만들고 파일을 삭제함
			return1=uploadFileDelete(request, model,IsitNull);
			
			System.out.println("return1->"+return1);
			System.out.println("return1이 String 맞음?->"+ return1 instanceof String);

			
			//if(return1=="1") {
			if(return1.equals("1")) {
				
				uploadinDB = uploadFile(file1.getOriginalFilename(),file1.getBytes(),uploadPath,comId1);
				logger.info("equals -->삭제 후 작업한 db의 이미지 내용이다 - uploadinDB: "+uploadinDB);
				
			} else if(return1 != "1") {
				System.out.println("DB->company->com_img에 있는 정보가 삭제되지 않았거나 무언가 문제가 발생함");
			}
		}
		
		return null;
	}
	
}
