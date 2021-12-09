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
	//경력사항 추가기능 파트
	var car_code_num=${fn:length(resumeDetailList) }; 
	var addResAppend="";
	$(document).ready( function() {
    	$(document).on("click", "#addResumeDetail", function() {
    		//alert(car_code_num);
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
	//경력사항 추가기능 파트 끝
	
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
		    },
		    error: function () {
		    	alert("실패");
		      // Handle upload error
		    }
		});
	}
	
	function uploadDelete() {
		alert('uploadDelete Start...');
		if(uploadsts=="submit"){
			img_path='${resumedetail.res_img}';
		}else{
			img_path=document.getElementById('res_img').value;
		}
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
			   document.getElementById('uploadsts_id').value=uploadsts;
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
    	alert("submit");
    	if(uploadsts!="non"){
    		uploadsts="submit";
    		uploadDelete();
    	}
    });
 // 이미지 업로드 파트 끝
</script>
</head>
<body>
<h1>mbMypageResumeUpdate</h1><p>
<c:if test="${res_select_msg eq false }">
 없는 이력서 입니다
</c:if>

<c:if test="${res_select_msg eq true }">
	<form action="mbMypageResumeUpdatePro" method="post">
		<input type="hidden" id="res_img" name="res_img" value="${resumedetail.res_img}">
		<input type="image" class="imagesquare1" src="${resumedetail.res_img}" 
			alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><p>						  
		<input  type="file"  id="file1" name="file1" /><p> 
		<input type="button" value="업로드" onclick="uploadFile()">
		<input type="button" value="삭제" id="delImg12" onclick="uploadDelete()"> 
	
	
		<input type="hidden" value="${mbid }" name="user_id">
		<input type='hidden' value="${resumedetail.rep_res }" name="rep_res">
		<input type='hidden' value="${resumedetail.res_code }" name="res_code">
	
		이력서 제목 <input type="text" name="res_title" value="${resumedetail.res_title }" required="required"><p>
		이름 : ${memberdetail.user_name }<br>
		전화번호 : ${memberdetail.user_tel }<br>
		주소 : ${memberdetail.user_addr }<p>
	
		이메일 : <input type="text" name="res_email" value="${resumedetail.res_email }"><p>
		
		자기소개<br>
		<textarea rows="10" cols="40" name="cov_let" >${resumedetail.cov_let }</textarea><p>
		
		학력사항<br>
		<c:if test="${memberdetail.user_edu >= 2 }">
			&nbsp;&nbsp;고등학교<br>
			학교명 <input type="text" name="hs_name" value="${resumedetail.hs_name }"><br>
			전공계열 
			<select name="hs_mjr">
				<c:forEach var="commlist" items="${commlist }">
					<c:if test="${resumedetail.hs_mjr eq commlist.sub_cat }">
						<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
					</c:if>
					<c:if test="${resumedetail.hs_mjr ne commlist.sub_cat }">
						<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
					</c:if>
				</c:forEach>
			</select> 
			<p>
		</c:if>
		<c:if test="${memberdetail.user_edu >= 3 }">
			&nbsp;&nbsp;대학교, 대학원<br>
			학교명 <input type="text" name="univ_name" value="${resumedetail.univ_name }"><br>
			재학기간 <input type="date" name="univ_date1" value="${univ_date1 }"> - <input type="date" name="univ_date2" value="${univ_date2 }"><br>
			전공 <input type="text" name="univ_mjr" value="${resumedetail.univ_mjr }"><p>
		</c:if>
		
		<p>
		경력사항 	
		<c:forEach var="resumeDetailList" items="${resumeDetailList}" varStatus="status">
			<div id="resDetail${resumeDetailList.car_code }">
				회사명 <input type='text' name='com_name_ar[]' value="${resumeDetailList.com_name }"><br>
				근무기간  <input type='date' name='emp_date1_ar[]' value="${emp_date1[status.index] }"> - <input type='date' name='emp_date2_ar[]' value="${emp_date2[status.index] }"><br>
				근무부서 <input type='text' name='emp_dept_ar[]' value="${resumeDetailList.emp_dept }"><br>
				담당업무 <input type='text' name='task_ar[]' value="${resumeDetailList.task }">&nbsp;&nbsp;&nbsp;
				<input type='button' value='경력사항 삭제' id='deleteResDetail' onclick="deleteResumeDetail(${resumeDetailList.car_code })"><p>
				<input type='hidden' name='car_code_ar[]' value="${resumeDetailList.car_code }"><p>
			</div>
		</c:forEach>
		<div id="resumeDetail"></div>
		<input type="button" value="+추가 생성" id="addResumeDetail"><br>
		<p>
		희망직종태그 <select name="res_tag1">
			<option value="">선택안함</option>
			<c:forEach var="commlist" items="${tag1_commlist }">
				<c:if test="${resumedetail.res_tag1 eq commlist.sub_cat }">
					<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
				</c:if>
				<c:if test="${resumedetail.res_tag1 ne commlist.sub_cat }">
					<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
				</c:if>
			</c:forEach>
		</select>
		<p>
		희망기술태그1 <select name="res_tag2">
			<option value="">선택안함</option>
			<c:forEach var="commlist" items="${tag2_commlist }">
				<c:if test="${resumedetail.res_tag2 eq commlist.sub_cat }">
					<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
				</c:if>
				<c:if test="${resumedetail.res_tag2 ne commlist.sub_cat }">
					<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
				</c:if>
			</c:forEach>
		</select>
		
		희망기술태그2 <select name="res_tag3">
			<option value="">선택안함</option>
			<c:forEach var="commlist" items="${tag2_commlist }">
				<c:if test="${resumedetail.res_tag3 eq commlist.sub_cat }">
					<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
				</c:if>
				<c:if test="${resumedetail.res_tag3 ne commlist.sub_cat }">
					<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
				</c:if>
			</c:forEach>
		</select>
		<p>
		기타 링크<br>
		<textarea rows="10" cols="40" name="res_etc_link">${resumedetail.res_etc_link }</textarea><p>
		
		<input type="submit" value="작성완료">
	</form>
</c:if>
</body>
</html>