<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업 아이디 찾기</title>
<link rel="stylesheet" href="css/sh/findId.css" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<c:if test="${user_id!=null }"> 찾는 개인 아이디 : ${user_id}</c:if><p>
		
		<div class="Shcontainer">
			
				<h2>기업아이디 찾기</h2>
				<form action="findComIdForm" >
					
					<div>
						<input type="text" name="com_name" id="com_name"  placeholder="회사명을 입력하세요">
						<label for="com_name">회사명</label>
					</div>
					
					<div>
						<input type="text" name="com_user" id="com_user"  placeholder="담당자명을 입력하세요">
						<label for="com_user">담당자명</label>
					</div>
					
					<div>
						<input type="text" name="com_regnum" id="com_regnum"  placeholder="사업자등록번호를 입력하세요">
						<label for="com_regnum">사업자등록번호</label>
					</div>
					
					
					<div>
						<input type="email" name="com_email" id="com_email"  placeholder="이메일을 입력하세요">
						<label for="com_email">이메일</label>
					</div>
					
					<input type="submit" value="아이디 찾기">
				</form>
	
			</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>