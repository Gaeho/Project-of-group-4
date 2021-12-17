<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp" %>
<%@ include file="myPageMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/sr/BookmarkList.css" rel="stylesheet" type="text/css">
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
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
</body>
</html>