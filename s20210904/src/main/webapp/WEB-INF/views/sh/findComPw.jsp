<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업비밀번호찾기</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<!-- 헤더부분 -->
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>

	<h2>기업 비밀번호 찾기</h2>
		<div class="findComPw">
			<form action="findComPwForm">
				회사명 : <input type="text" name="com_name"  placeholder="회사명을 입력하세요"><p>
				가입자명 : <input type="text" name="com_user"  placeholder="가입자명을 입력하세요"><p>
				아이디 : <input type="text" name="com_id"  placeholder="아이디를 입력하세요"><p>
				사업자 등록번호 : <input type="text" name="com_regnum"  placeholder="사업자등록번호를 입력하세요"><p>
				이메일 :  <input type="text" name="com_email"  placeholder="이메일을 입력하세요"><p>
				
				<input type="submit" value="비밀번호 찾기">
			</form>
		</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>