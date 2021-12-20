<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypage.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypageApplySum.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypageTable.css" rel="stylesheet" type="text/css">
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>


<div class="mypageContent-wrap">
	<div class="mypageTitle">
		<h1>마이페이지</h1>
		<%-- <c:if test="${not empty mypage_update_msg }">
			${mypage_update_msg} <p>
		</c:if> --%>
	</div>
	
	<div class="mbMypageMenu">
		<div class="menu_profile">
			<input type="image" class="profile_img" src="${profile}" 
				alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="profile_img" >
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
		<div class="mbMypageApplySum">
			<h2 class="mbMypageApplySum_title">지원 현황</h2>
			<ul class="mbMypageApplySum_ul">
				<li>
					<a href="mbMypageApply">
						<em>${countapply[0].applying}</em>
						<span>지원 완료</span>
					</a>
				</li>
				<li>
					<a href="mbMypageApply">
						<em>${countapply[0].passdoc}</em>
						<span>서류 통과</span>
					</a>
				</li>
				<li>
					<a href="mbMypageApply">
						<em>${countapply[0].failed}</em>
						<span>최종 합격</span>
					</a>
				</li>
				<li>
					<a href="mbMypageApply">
						<em>${countapply[0].pass}</em>
						<span>불합격</span>
					</a>
				</li>
			</ul>
		</div>
		
		<c:if test="${empty resumelist}">
			<h3 class="mbMypageTable_title">작성한 이력서가 없습니다</h3>
		</c:if>
		<c:if test="${not empty resumelist}">
			<h3 class="mbMypageTable_title">나의 이력서</h3>
			<div class="mbMypageTable">
				<table class="table">
					<tr class="table-warning">
						<th>번호</th><th>이력서 제목</th><th>작성 날짜</th><th>희망 직종</th><th></th>
					</tr>
					
					<c:forEach var="resumelist" items="${resumelist}" varStatus="status">
						<tr>
							<td>${status.count}</td><td>${resumelist.res_title}</td><td>${resumelist.res_date}</td>
							<td>
								<c:if test="${empty resumelist.comm_ctx}">없음</c:if>
								<c:if test="${not empty resumelist.comm_ctx}">${resumelist.comm_ctx}</c:if>
							</td>
							<td><c:if test="${resumelist.rep_res eq 1}">대표이력서</c:if></td>
							<%-- ${resumelist.comm_ctx} --%>
						</tr>
					</c:forEach> 
				</table>
			</div>
		</c:if>
		<br>
	</div>
	
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>