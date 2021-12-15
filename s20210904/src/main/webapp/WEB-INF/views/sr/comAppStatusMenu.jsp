<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="myPageMenu.jsp" %>
<link href="css/sr/comMypage.css" rel="stylesheet" type="text/css">
<%-- <%
	String context = request.getContextPath();
% --%>
>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div class="CompanyMypageContainer">
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		
<!-- 		---------------------------------------------------------------------------- -->
		<div class="compAppStatus_out">
			<div class="compAppStatus_in">
				<div class="compAppStatus_btn">
				<input type="button" value="진행중(${num})" onclick="location.href='ComAppStatus?id=0'">
				<input type="button" value="마감(${num})" onclick="location.href='ComAppStatus?id=1'">
			</div>
			<div class="compAppStatus_in">
			<table>
					<tr>
						<th>회원프사</th>
						<th>회원 아이디</th>
						<th>지원날짜</th>
						<th>공고 제목</th>
						<th>공고 마감 날짜</th>
					</tr>
				<c:forEach var="appAnnMember" items="${appAnnMember }">
						<tr>
							<td><img class="MemImg" src="${appAnnMember.user_img}" /></td>
							<td><a href="detail2?user_id=${appAnnMember.user_id }&com_id=${appAnnMember.com_id}&mrk_res_code=${appAnnMember.mrk_res_code}&isResume=1">${appAnnMember.user_id}</a></td>
							<td>${appAnnMember.app_regdate }</td>
							<td>${appAnnMember.anno_title}</td>
							<td>${appAnnMember.anno_c_regdate }</td>
						</tr>
					</c:forEach>
					</table>
			</div>
			</div>
		</div>
	</div>
	<div class="paging">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="ComAppStatus?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="ComAppStatus?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage }">
			<a href="CComAppStatus?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
		</c:if>
	</div>
</body>
</html>