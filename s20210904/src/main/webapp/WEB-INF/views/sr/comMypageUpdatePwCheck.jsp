<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comMypageUpdate.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="comInfoUpdateContainer">
	<div class="comInfoUpdate-items">
	<div class="comInfoUpdate-items-in">
		 <div><h1>마이페이지수정</h1><p></div>
		<div><form action="comMypageUpdateForm" method="post">
			<input class="pwinput" type="password" name="com_pw" placeholder="비밀번호를 입력"><br>
			<c:if test="${not empty msg }">${msg }<p></c:if>
			<input class="updateInput" type="submit" value="확인"> 
			<input type="button" value="취소" onclick="location.href='javascript:history.back();'"> 
		</form></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>