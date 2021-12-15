<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/sr/BookmarkList.css" rel="stylesheet" type="text/css">
<title>ComMypage</title>
<style type="text/css">
.testcss {
	width: 150px;
	height: 150px;
	border: 1px solid black;
}

.menuBox {
	text-decoration: none;
	text-align: center;
	color: white;
	padding: 8px 16px;
	background-color: black;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}

.menuBox:hover {
	color: black;
	background-color: white;
}
/*
.divTableRow {
	text-decoration: none;
	text-align: center;
	color: black;
	padding: 8px 16px;
	background-color: pink;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}
*/
.memberImg {
	width: 100px;
	height: 100px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<div class="CompanyMypageContainer">
		<a href="#" id="ComMylogo"> <img class="testcss" src="${company1.com_img}" /></a>
		<div class="CompanyMypageMenu" style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> <a
				class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br>
			<a class="menuBox" href="ComAnn"><span>채용공고</span></a><br>
			<a class="menuBox" href="bookmarkList"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemSearch"><span>검색</span></a>
		</div>
		<%-- <c:set var="num" value="${pg.total-pg.start+1 }"></c:set> --%>
		<div class="comMarkMemberMenu">
			    <table class="bookmarkList">
				  <tr>
				    <th>회원 프로필</th>
				    <th>회원 아이디</th>
				    <th>북마크 날짜</th>
				  </tr>
				
			<c:forEach var="bookmarkList" items="${bookmarkList }">
				<tr>
				  <td><img class="memberImg" src="${bookmarkList.user_img}"/></td>
				  <td><a href="detail2?user_id=${bookmarkList.user_id }&com_id=${bookmarkList.com_id}&mrk_res_code=${bookmarkList.mrk_res_code}">${bookmarkList.user_id}</a></td>
				  <td>${bookmarkList.mrk_date}</td> 
				  <td>${bookmarkList.mrk_res_code}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="ComMarkMember?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
	<a href="ComMarkMember?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="ComMarkMember?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>
</body>
</html>