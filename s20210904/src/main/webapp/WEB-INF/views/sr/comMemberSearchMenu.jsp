<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="myPageMenu.jsp"%>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
		<div class="comMemberSearch">
			<form class="search_form" action="SrSearch">
				<input class="search_keyword" name="keyword" type="text" placeholder="검색어를 입력하세요" />
				<button class="search_bnt" type="submit">search</button>
			</form>
		</div>
</body>
</html>