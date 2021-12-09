<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>     
<!DOCTYPE html>
<html>
<head>
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
      					+"회사명 <input type='text' name='com_name_ar[]' placeholder ='회사명을 입력해주세요'><br>"
						+"근무기간  <input type='date' name='emp_date1_ar[]'> - <input type='date' name='emp_date2_ar[]'><br>"
						+"근무부서 <input type='text' name='emp_dept_ar[]' placeholder ='부서명을 입력해주세요'><br>"
						+"담당업무 <input type='text' name='task_ar[]' placeholder ='담당한 업무를 입력해주세요'>&nbsp;&nbsp;&nbsp;"
						+"<input type='button' value='경력사항 삭제' id='deleteResDetail' onclick='deleteResumeDetail("+car_code_num+")'><p>"
						+"<input type='hidden' name='car_code_ar[]' value='"+car_code_num+"'><p></div>";
      		$("#resumeDetail").append(addResAppend);
      		car_code_num+=1;
    	});
  	});
	
	function deleteResumeDetail(car_code_num){
		alert(car_code_num);
		$("#resDetail"+car_code_num).remove();
	}
	
	// 이미지 업로드 파트
	var img_path="";
	var uploadsts="non";
	var page_location="resume";
	function uploadFile() {
	    alert('uploadFile Start...');
	    var form = new FormData();
	    /* var user_id = document.getElementById('user_id').value; */
	    img_path=document.getElementById('res_img').value;
	    alert('img_path>>'+img_path);
	    alert('uploadsts>>'+uploadsts);
	    
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
		     	alert("성공 data->"+data);
		    	document.getElementById('imagesquare1').src=data;
		    	document.getElementById('res_img').value=data;
		    	uploadsts="on";
		    	document.getElementById('uploadstate').value=uploadsts;
		    },
		    error: function () {
		    	alert("실패");
		      // Handle upload error
		    }
		});
	}
	
	function uploadDelete() {
		alert('uploadDelete Start...');
		
		img_path=document.getElementById('res_img').value;
		
		alert("uploadsts : "+uploadsts);
		alert('삭제할 내용 img_path : '+img_path);
 
	   $.ajax({
		   url: "mbMypageUploadDelete",
		   type: "POST",
		   data: {"img_path":img_path,"uploadsts":uploadsts},
		   dataType:'text',
		   success: function () {
			   alert("삭제성공!!");
			   document.getElementById('imagesquare1').src='src=/img/dj/no_Image.gif';
			   document.getElementById('res_img').value=null;
			   uploadsts="off";
			   document.getElementById('uploadstate').value=uploadsts;
			},
		    error: function () {
		    	alert("삭제실패ㅜㅜ");
		      // Handle upload error
		    }
		});
	}
	
	// 창을 벗어날때 upload했던 img파일 삭제
    $(window).on("beforeunload", function(){
    	alert("나가기");
    	if(uploadsts=="on"){
    		uploadDelete();
    	}
    });
    
	// submit 할 경우에는 원래 존재하던 img파일 삭제
    $(document).on("submit", "form", function(){ 
    	$(window).off("beforeunload");
    });
	// 이미지 업로드파트 끝
	
	
</script>

</head>
<body>
<h1>이력서작성</h1>
<form action="mbMypageResumeWritePro" method="post">
	<input type="hidden" value="${mbid }" name="user_id">
	<input type="hidden" name="uploadstate" id="uploadstate" value="non">
	
	<input type="hidden" id="res_img" name="res_img" value="${memberdetail.user_img}">
	<input type="image" class="imagesquare1" src="${memberdetail.user_img}" 
		alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><p>						  
	<input  type="file"  id="file1" name="file1" /><p> 
	<input type="button" value="업로드" onclick="uploadFile()">
	<input type="button" value="삭제" id="delImg12" onclick="uploadDelete()"> 

	이력서 제목 <input type="text" name="res_title" placeholder ="이력서제목을 입력해주세요" required="required"><p>
	이름 : ${memberdetail.user_name }<br>
	전화번호 : ${memberdetail.user_tel }<br>
	주소 : ${memberdetail.user_addr }<p>

	이메일 : <input type="text" name="res_email" value="${memberdetail.user_email }"><p>
	
	자기소개<br>
	<textarea rows="10" cols="40" name="cov_let"></textarea><p>
	
	학력사항<br>
	<c:if test="${memberdetail.user_edu >= 2 }">
		&nbsp;&nbsp;고등학교<br>
		학교명 <input type="text" name="hs_name" placeholder ="고등학교명을 입력해주세요"><br>
		전공계열 
		<select name="hs_mjr">
			<c:forEach var="commlist" items="${hs_mjr_commlist }">
				<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
			</c:forEach>
		</select> 
		<p>
	</c:if>
	<c:if test="${memberdetail.user_edu >= 3 }">
		&nbsp;&nbsp;대학교, 대학원<br>
		학교명 <input type="text" name="univ_name" placeholder ="대학교명을 입력해주세요"><br>
		재학기간 <input type="date" name="univ_date1"> - <input type="date" name="univ_date2"><br>
		전공 <input type="text" name="univ_mjr" placeholder ="전공명을 입력해주세요"><p>
	</c:if>
	
	<p>
	경력사항 
	<div id="resumeDetail"></div>
	<input type="button" value="+추가 생성" id="addResumeDetail"><br>
	<p>
	희망직종태그 <select name="res_tag1">
		<option value="">선택안함</option>
		<c:forEach var="commlist" items="${tag1_commlist }">
			<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
		</c:forEach>
	</select>
	<p>
	희망기술태그1 <select name="res_tag2">
		<option value="">선택안함</option>
		<c:forEach var="commlist" items="${tag2_commlist }">
			<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
		</c:forEach>
	</select>
	
	희망기술태그2 <select name="res_tag3">
		<option value="">선택안함</option>
		<c:forEach var="commlist" items="${tag2_commlist }">
			<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
		</c:forEach>
	</select>
	<p>
	기타 링크<br>
	<textarea rows="10" cols="40" name="res_etc_link"></textarea><p>
	
	<input type="submit" value="작성완료">
</form>

</body>
</html>