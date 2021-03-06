<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	var car_code_num=0;
	var addResAppend="";
	$(document).ready( function() {
    	$(document).on("click", "#addResumeDetail", function() {
      		addResAppend="<div id='resDetail"+car_code_num+"'>"
      					+	"<div class='mbDeleteBtn_area'>"
      					+		"<input type='button' class='mbDeleteBtn' value='삭제 x' id='deleteResDetail' onclick='deleteResumeDetail("+car_code_num+")'>"
      					+	"</div>"
      					+	"<div class='mbFormInput mb_flex'>"
      					+		"<div class='mbFormText'>회사명</div>"
      					+		"<input type='text' class='mb_width4' name='com_name_ar[]' placeholder ='회사명 입력' required='required'>"
      					+	"</div>"
      					+	"<div class='mbFormInput mb_flex'>"
      					+		"<div class='mbFormText'>근무기간</div>"
      					+		"<input type='date' name='emp_date1_ar[]' required='required'>"
      					+		"<div class='mbFormDate'> - </div>"
      					+		"<input type='date' name='emp_date2_ar[]' required='required'>"
      					+	"</div>"
      					+	"<div class='mbFormInput mb_flex'>"
      					+		"<div class='mbFormText'>근무부서</div>"
      					+		"<input type='text' class='mb_width4' name='emp_dept_ar[]' placeholder ='근무부서 입력' required='required'>"
      					+	"</div>"
      					+	"<div class='mbFormInput mb_flex'>"
      					+		"<div class='mbFormText'>담당업무</div>"
      					+		"<input type='text' class='mb_width6' name='task_ar[]' placeholder ='담당업무 입력' required='required'>"
      					+	"</div><hr><p>"
						+	"<input type='hidden' name='car_code_ar[]' value='"+car_code_num+"'>"
      					+"</div>";
      		$("#resumeDetail").append(addResAppend);
      		car_code_num+=1;
    	});
  	});

	function deleteResumeDetail(car_code_num){
		/* alert(car_code_num); */
		$("#resDetail"+car_code_num).remove();
	}
	
	// 이미지 업로드 파트
	var img_path="";
	var uploadsts="non";
	var page_location="resume";
	function uploadFile() {
	    /* alert('uploadFile Start...'); */
	    var form = new FormData();
	    /* var user_id = document.getElementById('user_id').value; */
	    img_path=document.getElementById('res_img').value;
	    /* alert('img_path>>'+img_path);
	    alert('uploadsts>>'+uploadsts); */
	    
	    form.append( "file1", $("#file1")[0].files[0] );
		form.append( "img_path", img_path);
		form.append( "uploadsts", uploadsts);
		form.append( "page_location", page_location);
		
		$.ajax({
		    url: "/mbMypageImguploadForm",
		    type: "POST",
		    data: form,
		    enctype: 'multipart/form-data',
		    processData: false,
		    contentType: false,
		    datatype:'text',
		    success: function (data) {
		     /*  $('input[name=com_img11]').attr('src',data); */
		     	/* alert("성공 data->"+data); */
		    	document.getElementById('imagesquare1').src=data;
		    	document.getElementById('res_img').value=data;
		    	uploadsts="on";
		    	document.getElementById('uploadstate').value=uploadsts;
		    },
		    error: function () {
		    	alert("업로드 실패");
		      // Handle upload error
		    }
		});
	}
	
	function uploadDelete() {
		/* alert('uploadDelete Start...'); */
		
		img_path=document.getElementById('res_img').value;
		
		/* alert("uploadsts : "+uploadsts);
		alert('삭제할 내용 img_path : '+img_path); */
 
	   $.ajax({
		   url: "mbMypageUploadDelete",
		   type: "POST",
		   data: {"img_path":img_path,"uploadsts":uploadsts},
		   dataType:'text',
		   success: function () {
			   /* alert("삭제성공!!"); */
			   document.getElementById('imagesquare1').src='src=/img/dj/no_Image.gif';
			   document.getElementById('res_img').value=null;
			   uploadsts="off";
			   document.getElementById('uploadstate').value=uploadsts;
			},
		    error: function () {
		    	/* alert("삭제실패ㅜㅜ"); */
		      // Handle upload error
		    }
		});
	}
	
	// 창을 벗어날때 upload했던 img파일 삭제
    $(window).on("beforeunload", function(){
    	// alert("나가기");
    	if(uploadsts=="on"){
    		uploadDelete();
    	}
    });
    
	// submit 할 경우에는 beforeunload 동작안함
    $(document).on("submit", "form", function(){ 
    	$(window).off("beforeunload");
    	uploadsts="submit";
    	// alert("submit : "+uploadsts);
    	
    });
	// 이미지 업로드파트 끝
	
	
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="mypageContent-wrap">
	<div class="mypageTitle">
		<h1>이력서작성</h1><p><p>
	</div>
	
	<div class="mbMypageMenu">
		<div class="menu_profile">
			<input type="image" class="profile_img" src="${profile}" 
				alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="profile_img" >
			<div class="mbFormText mb_center">${mbid } 님</div>
		</div>
		
		<p>
		
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon1.png" onclick="location.href='mbMypage'">
			<a class="mbMypageMenuBox" href="mbMypage">마이페이지홈</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon2.png" onclick="location.href='mbMypageApply'">
			<a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon3.png" onclick="location.href='mbMypageApply?notice_msg=2'">
			<a class="mbMypageMenuBox" href="mbMypageApply?notice_msg=2">나의 이력서 열람기업</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon4.png" onclick="location.href='mbMypageResume'">
			<a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon5.png" onclick="location.href='mbMypageResumeWrite'">
			<a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon6.png" onclick="location.href='mbMypageScrap'">
			<a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon7.png" onclick="location.href='mbMypageUpdate'">
			<a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a>
		</div>
	</div>
	
	<div class="mbMypageMain">
		<div class="mbForm">
			<form action="mbMypageResumeWritePro" method="post">
				<input type="hidden" value="${mbid }" name="user_id">
				<input type="hidden" name="uploadstate" id="uploadstate" value="non">
				
				<div class="mbFormTitle"><a>기본 정보</a></div>
				<div class="mbFormText">이력서 사진</div>
				<div class="mb_flex mb_p1">
					<input type="hidden" id="res_img" name="res_img" value="${memberdetail.user_img}">
					<input type="image" class="profile_img" src="${memberdetail.user_img}" 
						alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" >	
					<div class="mbProfileBtn">					  
						<input  type="file"  id="file1" name="file1" /><p><p>
						<input type="button" value="업로드" onclick="uploadFile()">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭제" id="delImg12" onclick="uploadDelete()"> 
					</div>
				</div>
				
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">이력서 제목</div>
					<input class="mb_width6" type="text" name="res_title" required="required" placeholder ="이력서 제목 입력">
				</div>
				
				<div class="mb_flex">
					<div class="mbFormText">이름</div><div class="mbFormText">${memberdetail.user_name }</div>
				</div>
				 
			 	<div class="mb_flex">
					<div class="mbFormText">전화번호</div><div class="mbFormText">${memberdetail.user_tel }</div>
				</div>
				
				<div class="mb_flex">
					<div class="mbFormText">주소</div><div class="mbFormText">${memberdetail.user_addr }</div>
				</div>
				
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">이메일</div>
					<input type="text" value="${memberdetail.user_email }" name="res_email">
				</div>
			
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">자기소개</div>
					<textarea class="mb_width6 mb_height3" name="cov_let"></textarea>
				</div>
				
				
				
				
				<c:if test="${memberdetail.user_edu >= 2 }">
					<p><p>
					<div class="mbFormTitle">학력사항</div>
					
					<div class="mbFormSubTitle">고등학교</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">학교명</div>
						<input type="text" class="mb_width4" name="hs_name" placeholder ="고등학교명 입력">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">전공계열</div>
						<select name="hs_mjr">
							<c:forEach var="commlist" items="${hs_mjr_commlist }">
								<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
							</c:forEach>
						</select> 
					</div>
				</c:if>
				<c:if test="${memberdetail.user_edu >= 3 }">
					<hr>
					<div class="mbFormSubTitle">대학교 및 대학원</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">학교명</div>
						<input type="text" class="mb_width4" name="univ_name" placeholder ="대학교명 입력">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">재학기간</div>
						<input type="date" name="univ_date1" required="required"> 
						<div class="mbFormDate"> - </div>
						<input type="date" name="univ_date2" required="required">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">전공</div>
						<input type="text" class="univ_mjr" name="univ_name" placeholder ="전공명 입력">
					</div>
				</c:if>
				<p><p>
				
				
				<div class="mbFormTitle">경력사항</div>
				<div id="resumeDetail"></div>
				<input class="mbBtn btn btn-primary" type="button" value="추가 생성 +" id="addResumeDetail">
				<p><p>
				
				
				<div class="mbFormTitle">기타사항</div>
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">희망직종태그</div>
					<select name="res_tag1">
						<option value="">선택안함</option>
						<c:forEach var="commlist" items="${tag1_commlist }">
							<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
						</c:forEach>
					</select> 
				</div>
				
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">희망기술태그1</div>
					<select name="res_tag2">
						<option value="">선택안함</option>
						<c:forEach var="commlist" items="${tag2_commlist }">
							<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
						</c:forEach>
					</select> 
					
					<div class="mbFormText">희망기술태그2</div>
					<select name="res_tag3">
						<option value="">선택안함</option>
						<c:forEach var="commlist" items="${tag2_commlist }">
							<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
						</c:forEach>
					</select> 
				</div>
				
				<div class="mbFormInput mb_flex">
					<div class="mbFormText">기타 링크</div>
					<textarea name="res_etc_link" rows="10" cols="40" ></textarea>
				</div>
				
				<input class="mbBtnleft btn btn-primary" type="submit" value="작성완료" id="submit_btn"> 
				<input class="mbBtn btn btn-primary" type="button" value="취소" onclick="location.href='javascript:history.back();'">
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>