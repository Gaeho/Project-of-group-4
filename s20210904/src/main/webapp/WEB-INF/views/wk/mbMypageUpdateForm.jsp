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
	var img_path="";
	var uploadsts="non";
	var page_location="mypage";
	function uploadFile() {
	    // alert('uploadFile Start...');
	    var form = new FormData();
	    /* var user_id = document.getElementById('user_id').value; */
	    img_path=document.getElementById('user_img').value;
	    // alert('img_path>>'+img_path);
	    // alert('uploadsts>>'+uploadsts);
	    
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
		    	document.getElementById('user_img').value=data;
		    	uploadsts="on";
		    },
		    error: function () {
		    	/* alert("실패"); */
		      // Handle upload error
		    }
		});
	}
	
	function uploadDelete() {
		/* alert('uploadDelete Start...'); */
		if(uploadsts=="submit"){
			img_path='${member.user_img}';
		}else{
			img_path=document.getElementById('user_img').value;
		}
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
			   document.getElementById('user_img').value=null;
			   uploadsts="off";
			   document.getElementById('uploadsts_id').value=uploadsts;
			},
		    error: function () {
		    	/* alert("삭제실패ㅜㅜ"); */
		      // Handle upload error
		    }
		});
	}
	
	// 창을 벗어날때 upload했던 img파일 삭제
    $(window).on("beforeunload", function(){
    	/* alert("나가기"); */
    	if(uploadsts=="on"){
    		uploadDelete();
    	}
    });
	
 	// submit 할 경우에는 원래 존재하던 img파일 삭제
    $(document).on("submit", "form", function(){ 
    	$(window).off("beforeunload");
    	/* alert("submit"); */
    	if(uploadsts!="non"){
    		uploadsts="submit";
    		uploadDelete();
    	}
    });
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="mypageContent-wrap">
	<div class="mypageTitle">
		<h1>마이페이지수정</h1>
	</div>
	
	<div class="mbMypageMenu">
		<div class="menu_profile">
			<input type="image" class="profile_img" src="${profile}" 
				alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" >
			<div class="mbFormText">${mbid } 님</div>
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
			<div>
				<form id="mypage_form" action="mbMypageUpdatePro" method="post">
					<div class="mbFormText">프로필 사진</div>
					<div class="mb_flex">
						<input type="hidden" id="user_img" name="user_img" value="${member.user_img}">
						<input type="image" class="profile_img" src="${member.user_img}" 
							alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" >
						<div class="mbProfileBtn">
							<input  type="file"  id="file1" name="file1" /><p><p>
							<input type="button" value="업로드" onclick="uploadFile()">&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" id="delImg12" onclick="uploadDelete()">
						</div>
					</div>
											  
					 <div class="mb_flex">
					 	<div class="mbFormText">아이디</div><div class="mbFormText">${member.user_id }</div>
					 </div>
					
					<input type="hidden" value="${member.user_id }" name="user_id">
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">비밀번호</div>
						<input type="password" value="${member.user_pw}" name="user_pw">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">이름</div>
						<input type="text" value="${member.user_name }" name="user_name">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">생년월일</div>
						<input type="text" value="${member.user_brh }" name="user_brh">
					</div>
					
					<div class="mb_flex">
						<div class="mbFormText">성별</div>
						<c:if test="${member.user_sex eq 'F' }">
							<div class="mb_center form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_sex" value="F" id="mbCheckbox1" checked="checked">
								<label class="form-check-label" for="mbCheckbox1">남성</label>
							</div>
							<div class="mb_center form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_sex" value="M" id="mbCheckbox2">
								<label class="form-check-label" for="mbCheckbox2">여성</label>
							</div>
							<!-- <label><input type="radio" value="F" name="user_sex" checked="checked">남성</label> 
							<label><input type="radio" value="M" name="user_sex">여성</label>  -->
						</c:if>
						<c:if test="${member.user_sex eq 'M' }">
							<div class="mb_center form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_sex" value="F" id="mbCheckbox1">
								<label class="form-check-label" for="mbCheckbox1">남성</label>
							</div>
							<div class="mb_center form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_sex" value="M" id="mbCheckbox2" checked="checked">
								<label class="form-check-label" for="mbCheckbox2">여성</label>
							</div>
						</c:if>
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">학력</div>
						<select name="user_edu">
							<c:forEach var="commlist" items="${user_edu_commlist }">
								<c:if test="${member.user_edu eq commlist.sub_cat }">
									<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
								</c:if>
								<c:if test="${member.user_edu ne commlist.sub_cat }">
									<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">전화번호</div>
						<input type="text" value="${member.user_tel }" name="user_tel">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">이메일</div>
						<input type="text" value="${member.user_email }" name="user_email">
					</div>
					
					<div class="mbFormInput mb_flex">
						<div class="mbFormText">주소</div>
						<input type="text" value="${member.user_addr }" name="user_addr" style="width: 250px;">
					</div>
					
					<input class="mbBtnleft btn btn-primary" type="submit" value="확인" id="submit_btn"> 
					<input class="mbBtn btn btn-primary" type="button" value="취소" onclick="location.href='mbMypage'">
				
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

		