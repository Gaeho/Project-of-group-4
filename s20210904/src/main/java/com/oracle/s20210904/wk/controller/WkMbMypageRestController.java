package com.oracle.s20210904.wk.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	
	
//	마이페이지 수정 이미지 업로드(db에 이미지만 저장하고 파일경로 출력함)
	@PostMapping(value="mbMypageImguploadForm", produces = "application/text; charset=UTF-8")
	public String mbMypageImguploadForm(HttpServletRequest request,Model model, MultipartFile file1,
									@RequestParam(value="img_path") String img_path,
									@RequestParam(value="uploadsts") String uploadsts,
									@RequestParam(value="page_location") String page_location) {
		System.out.println("WkMbMypageRestController mbMypageImguploadForm()");
		String mbid=checkId(request);
		
		String uploadinDB = null;
		String uploadPath_mid=null;
		if(page_location.equals("mypage")) {
			uploadPath_mid="/upload/wk/mypage/";
		}else if(page_location.equals("resume")) {
			uploadPath_mid="/upload/wk/resume/";
		}
		 
		String uploadPath = request.getSession().getServletContext().getRealPath(uploadPath_mid);
		System.out.println("생성 시 uploadPath->"+uploadPath);
		//업로드 경로를 만든다. 메타데이터 아래에 경로를 둔다. 가장 아래에 upload라는 폴더를 만들고 거기에 파일을 둔다.

		System.out.println("uploadForm 시작되었습니다.");
		
		System.out.println("originalName: "+file1.getOriginalFilename());//사진의 원래 이름을 보여준다
		
		System.out.println("size: " + file1.getSize());//사진의 용량
		System.out.println("contentType: " + file1.getContentType());//사진의 타입
		
		//	img_path는 이미지 경로, uploadsts는 mbMypageUpdateForm.jsp에서 업로드를 한적이 없으면(혹은 삭제했을때) off, 업로드한적 있으면 on
		//	on이라면 img_path에서 파일을 지워줘야됨
		//	이 짓을 왜 하나?-> 이것을 안하면 /upload/폴더에 물리적으로 파일이 계속 쌓임
	
		System.out.println("user_img가 null인지 확인->"+img_path);
		System.out.println("uploadsts : "+uploadsts);
		
		// uploadsts on/off확인을 통해 기존 img_path의 파일을 지울지말지 정함
		int delete_return=1;
		try {
			if(uploadsts.equals("on")) {
				 //(img_path 파일 삭제)
				String img_realpath=request.getSession().getServletContext().getRealPath(img_path);
				delete_return=uploadFileDelete(img_realpath);
			}
			if(delete_return==1) {
				uploadinDB = uploadFile(file1.getOriginalFilename(),file1.getBytes(),uploadPath,uploadPath_mid,mbid);
				System.out.println("uploadinDB: "+uploadinDB);
			}else {
				System.out.println("uploadFileDelete()에 문제가 있음");
			}
			
		} catch (Exception e) {
			System.out.println("WkMbMypageRestController mbMypageImguploadForm() error : "+e.getMessage());
		}
		return uploadinDB;
	}
	
	// 마이페이지 수정 이미지 삭제(db에 이미지만 삭제하고 파일경로 출력함)
	@PostMapping(value="mbMypageUploadDelete", produces = "application/text; charset=UTF-8")//, method= RequestMethod.GET)
	public String mbMypageUploadDelete(HttpServletRequest request,Model model,
										String img_path, String uploadsts)  throws Exception{
		
		System.out.println("WkMbMypageRestController mbMypageUploadDelete()");
		System.out.println("img_path uploadsts : "+img_path+" -- "+uploadsts);
		String img_realpath=null;
//		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		if(uploadsts.equals("on") || uploadsts.equals("submit")) {
			img_realpath = request.getSession().getServletContext().getRealPath(img_path);
			System.out.println("WkMbMypageRestController mbMypageUploadDelete() img_realpath : "+img_realpath);
			uploadFileDelete(img_realpath);
		}else {
			img_realpath="삭제안함";
		}
		

//		String returnsomething = Integer.toString(delResult);
		return img_realpath;
	}
	
	
	//uploadForm에서 호출하는 메소드이다.원래이름,용량,경로를 받아 처리한다.
	private String uploadFile(String originalName, byte[] fileData, String uploadPath ,String uploadPath_mid ,String mbid) throws Exception {
		System.out.println("WkMbMypageRestController uploadFile()");
		UUID uid = UUID.randomUUID();

		System.out.println("uploadPath->" + uploadPath);

		// 업로드 폴더가 있는지 검사하여 없으면 생성한다.
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) { // 만약 파일디렉토리가 존재하지 않는다면,
			fileDirectory.mkdirs(); // mkdirs=make directory 폴더를 만들어라
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}

		// 저장이름을 만든다. 'uuid로 만든 문자열_원래이름' 조합하여 만든다.
		String savedName = uid.toString() + "_" + originalName;
		// uid를 String화 해서 원래 이름과 잇는다

		File target = new File(uploadPath, savedName); // 경로와 이름을 가지고 새로운 File 인스턴스 생성/생성만 했다.
		FileCopyUtils.copy(fileData, target); // org.springframework.util.FileCopyUtils
		// 파일 데이터, 경로, 이름을 복사한다. 그래서 올린다. 인스턴스를 저장한다.

		String uploadinDB = uploadPath_mid + savedName;
		System.out.println("db에 저장될 imgpath : " + uploadinDB);
		// 이름에 /upload/를 앞에 붙여서 쉽게 꺼내 쓸 수 있도록 함

		return uploadinDB;// 조합한 이름을 리턴한다.
	}

	// upload한 파일을 삭제하는 메소드다(db에서는 삭제 안함)
	private int uploadFileDelete(String img_realpath) throws Exception{
		System.out.println("WkMbMypageRestController uploadFileDelete()");
		int result = 0;
		System.out.println("uploadFileDelete img_path -> "+img_realpath);
		File file = new File(img_realpath);
		if(file.exists()) { 
			if(file.delete()) { //<--여기에서 파일이 물리적으로 삭제된다.
				System.out.println("img_path 파일삭제 성공");
				result = 1;					
			} else {
				System.out.println("img_path 파일삭제 실패");
				result=0;
			}
		} else {
			System.out.println("img_path 파일이 존재하지 않습니다.");
			result = -1;
		}
		return result;
	}
	
	
}
