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
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
		<div class="comAnnMenu">
			<table>
				<tr>
					<th>공고 코드</th>
					<th>공고 제목</th>
					<th>공고 작성일</th>
					<th>공고 마감일</th>
				</tr>
				<c:forEach var="listAnn" items="${listAnn }">
					<tr>
						<td>${listAnn.anno_code}</td>
						<td><a
							href="detail?anno_code=${listAnn.anno_code}&com_id=${listAnn.com_id}">${listAnn.anno_title}</a></td>
						<td>${listAnn.anno_regdate}</td>
						<td>${listAnn.anno_c_regdate }</td>
					</tr>
				</c:forEach>
			</table>
			<input class="annoWrite" type="button" value="공고 작성하기" onclick="location.href='DjAnnoWriteForm'">
		</div>
	</div>
</body>
</html>