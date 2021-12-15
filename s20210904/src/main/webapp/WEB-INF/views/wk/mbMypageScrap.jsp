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
		<h1>스크랩(${scarpcount })</h1><p><p>
	</div>
	<div class="mbMypageMenu">
		<input type="image" class="profile_img" src="${profile}" 
			alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><br>
			${mbid } 님<p>
		<ul>
			<li><a class="mbMypageMenuBox" href="mbMypage">마이페이지홈</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a></li>
		</ul>
	</div>
	<div class="mbMypageMain">
		<table>
			<tr><th>기업명</th><th>공고명</th><th>경력</th><th>학력</th><th>급여</th><th>마감일</th></tr>
			<c:forEach var="scarplist" items="${scarplist}">
				<tr><td>${scarplist.com_name }</td>
				    <td><a href="detail?anno_code=${scarplist.anno_code }">${scarplist.anno_title }</a></td>
					<td>${scarplist.comm_ctx }</td>
					<td>${scarplist.rec_edu }</td>
					<td>${scarplist.pay_info }</td>
					<td>${scarplist.anno_c_regdate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>