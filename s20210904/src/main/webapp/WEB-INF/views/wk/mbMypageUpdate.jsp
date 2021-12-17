<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="mypageContent-wrap">
	<div class="mypageTitle">
		<h1>마이페이지수정</h1><p>
	</div>
	<div class="mbMypageMenu">
		<input type="image" class="profile_img" src="${profile}" 
			alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><br>
			${mbid } 님<p>
		<ul>
			<li><a class="mbMypageMenuBox" href="mbMypage">마이페이지홈</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageApply?notice_msg=2">나의 이력서 열람기업</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a></li>
		</ul>
	</div>
	<div class="mbMypageMain">
		<form action="mbMypageUpdateForm" method="post">
			비밀번호를 입력하세요<br>
			<input type="password" name="user_pw"><br>
			<c:if test="${not empty msg }">${msg }<p></c:if>
			<input type="submit" value="확인"> 
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>