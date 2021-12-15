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
	var img_path="";
	var uploadsts="non";
	var page_location="mypage";
	function uploadFile() {
	    alert('uploadFile Start...');
	    var form = new FormData();
	    /* var user_id = document.getElementById('user_id').value; */
	    img_path=document.getElementById('user_img').value;
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
		    	document.getElementById('user_img').value=data;
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
			img_path='${member.user_img}';
		}else{
			img_path=document.getElementById('user_img').value;
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
			   document.getElementById('user_img').value=null;
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
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<h1>마이페이지수정페이지</h1>
<form id="mypage_form" action="mbMypageUpdatePro" method="post">

	<input type="hidden" id="user_img" name="user_img" value="${member.user_img}">
	<input type="image" class="imagesquare1" src="${member.user_img}" 
		alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><p>						  
	<input  type="file"  id="file1" name="file1" /><p> 
	<input type="button" value="업로드" onclick="uploadFile()">
	<input type="button" value="삭제" id="delImg12" onclick="uploadDelete()"> 
	
	아이디 <input type="hidden" value="${member.user_id }" name="user_id">${member.user_id }<br>
	비밀번호 <input type="password" value="${member.user_pw}" name="user_pw"><br>
	이름 <input type="text" value="${member.user_name }" name="user_name"><br>
	생년월일 <input type="text" value="${member.user_brh }" name="user_brh"><br>
	성별 
	<c:if test="${member.user_sex eq 'F' }">
		<label><input type="radio" value="F" name="user_sex" checked="checked">남성</label>
		<label><input type="radio" value="M" name="user_sex">여성</label>
	</c:if>
	<c:if test="${member.user_sex eq 'M' }">
		<label><input type="radio" value="F" name="user_sex" >남성</label>
		<label><input type="radio" value="M" name="user_sex" checked="checked">여성</label>
	</c:if>
	<br>
	학력
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
	<br>
	전화번호 <input type="text" value="${member.user_tel }" name="user_tel"><br>
	이메일 <input type="text" value="${member.user_email }" name="user_email"><br>
	주소 <input type="text" value="${member.user_addr }" name="user_addr"><br>
	<input type="submit" value="확인" id="submit_btn"> <input type="button" value="취소"><br>

</form>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

		