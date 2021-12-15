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
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>


<div class="mypageContent-wrap">
	<div>
		<h1>mbMypage</h1>
		<c:if test="${not empty mypage_update_msg }">
			${mypage_update_msg} <p>
			<script type="text/javascript">
				alert("1");
			</script>
		</c:if>
	</div>
	<!-- https://seill.tistory.com/426 -->
	<div>
		<ul class="mbMypageMenu">
		  <li><a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a></li>
		  <li><a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a></li>
		  <li><a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a></li>
		  <li><a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a></li>
		  <li><a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a></li>
		</ul>
	</div>
	
	
	<div class="mbMypageMain">
		mbid : ${mbid }<p>
		
		지원완료 : ${countapply[0].applying}<br>
		서류통과 : ${countapply[0].passdoc}<br>
		최종합격 : ${countapply[0].failed}<br>
		불합격 : ${countapply[0].pass}<p>
		
		${mbid }의 이력서<br>
		
		
		
		<table>
			<tr>
				<th>번호</th><th>이력서 제목</th><th>작성 날짜</th><th>대표이력서</th>
			</tr>
			
			<c:forEach var="resumelist" items="${resumelist}" varStatus="status">
				<tr>
					<td>${status.count}</td><td>${resumelist.res_title}</td><td>${resumelist.res_date}</td>
					<td><c:if test="${resumelist.rep_res eq 1}">대표이력서</c:if></td>
					<%-- ${resumelist.comm_ctx} --%>
				</tr>
			</c:forEach>
			
		</table>
		<br>
		
	<!-- 	<a href="mbMypageApply">입사지원현황</a><br>
		<a href="mbMypageResume">이력서관리</a><br>
		<a href="mbMypageResumeWrite">이력서작성</a><br>
		<a href="mbMypageScrap">스크랩</a><br>
		<a href="mbMypageUpdate">마이페이지수정</a><br> -->
	</div>
	
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>