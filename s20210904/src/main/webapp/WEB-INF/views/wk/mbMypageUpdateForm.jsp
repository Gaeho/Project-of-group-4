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
	function uploadFile() {
	    alert('uploadFile Start...');
	    var form = new FormData();
	    var user_id = document.getElementById('user_id').value;
	    alert('user_id>>'+user_id);
	    
	    form.append( "file1", $("#file1")[0].files[0] );
		form.append( "user_id", $("#user_id")[0].value);
	    
		$.ajax({
		    url: "/mbMypageImguploadForm",
		    type: "POST",
		    data: form,
		    enctype: 'multipart/form-data',
		    processData: false,
		    contentType: false,
		    datatype:'text',
		    success: function (data) {
		    	alert("성공");
		     /*  $('input[name=com_img11]').attr('src',data); */
		     	alert("도대체 뭔가 들어있긴 하니?->"+data)
		    	document.getElementById('imagesquare1').src=data;
		    	document.getElementById('imagesquare1').value=data;
		    	
		    },
		    error: function () {
		    	alert("실패");
		      // Handle upload error
		      // ...
		    }
		});
	}
	
	function deleteFile() {
	    alert('deleteFile Start...');
	    var form1 = new FormData();
	   alert('삭제할 내용'+document.getElementById('imagesquare1').value);

	   //form1.append( "comImg123", $("#imagesquare1")[0].value);
	   
	  var comImg123 ={"comImg123": document.getElementById('imagesquare1').value.toString()}

	  /*    comImg123.value = null; */

	/* 	 this.clearImage()  */
	 
	/* 	form1.append( "imgpath11", document.getElementById('imagesquare1').value);
	 */    
		$.ajax({
		    url: "DjComImguploadForm",
		    data: comImg123,
		    dataType:'text',
		    success: function (data) {
		    	alert("삭제성공!!"+data);
		    	document.getElementById('imagesquare1').src='src=/img/dj/no_Image.gif';
		    	
		    },
		    error: function () {
		    	alert("삭제실패ㅜㅜ");
		      // Handle upload error
		      // ...
		    }
		});
	}
</script>
</head>
<body>
<h1>마이페이지수정페이지</h1>
<form id="fileForm" name="frm" method="post">
	<input class="imagesquare1" name="com_img11" type="image" src="${member.user_img}" 
		alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" 
		value="${member.user_img}"><p>						  
		<input  type="file"  id="file1" name="file1" />
		<input type="hidden" id="user_id" name="user_id" value ="${member.user_id}" ><p> 
		<input type="button" value="업로드" onclick="uploadFile()">
	<input type="button" value="삭제" id="delImg12" onclick="deleteFile()">
</form>

<form action="mbMypageUpdatePro" method="post">
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
	학력 <input type="text" value="${member.user_edu }" name="user_edu"><br>
	전화번호 <input type="text" value="${member.user_tel }" name="user_tel"><br>
	이메일 <input type="text" value="${member.user_email }" name="user_email"><br>
	주소 <input type="text" value="${member.user_addr }" name="user_addr"><br>
	<input type="submit" value="확인"> <input type="button" value="취소"><br>

</form>

</body>
</html>