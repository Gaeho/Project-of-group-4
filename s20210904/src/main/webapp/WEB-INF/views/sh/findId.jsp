<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인아이디찾기</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<!-- 헤더부분 -->
<%@ include file="/WEB-INF/views/header.jsp"%>

<body>
<h2>개인 아이디 찾기</h2>
       <c:if test="${user_id!=null }"> 찾는 개인 아이디 : ${user_id}</c:if><p>
		<div class="findId">
			<form action="findIdForm" >
				이름 : <input type="text" name="user_name"  placeholder="이름을 입력하세요">
				이메일 : <input type="text" name="user_email"  placeholder="이메일을 입력하세요">	
				
		
		
			<input type="submit" value="아이디찾기"><p>
			
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>