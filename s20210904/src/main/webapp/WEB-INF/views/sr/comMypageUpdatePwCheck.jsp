<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<h1>마이페이지수정</h1><p>
<form action="comMypageUpdateForm" method="post">
	비밀번호를 입력하세요<br>
	<input type="password" name="com_pw"><br>
	<c:if test="${not empty msg }">${msg }<p></c:if>
	<input type="submit" value="확인"> 
</form>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>