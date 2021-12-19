<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업비밀번호찾기</title>
<link rel="stylesheet" href="css/sh/findPw.css" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="container">
        <h2>비밀번호 찾기</h2>
        	<form action="findComPwForm">
           		 <div>
		                <input type="text" name="" id="com_name"   required>
		                <label for="com_name">회사명</label>
            	  </div>

            		<div>
		                <input type="text" name="" id="com_user"  required>
		                <label for="com_user">가입자명</label>
            		</div>

            		<div>
		                <input type="text" name="" id="com_id"  required>
		                <label for="com_id">아이디</label>
           		    </div>
            
            		<div>
		                <input type="text" name="" id="com_regnum"  required>
		                <label for="com_regnum">사업자등록번호</label>
            		</div>
            
            		<div>
		                <input type="text" name="" id="com_email"  required>
		                <label for="com_email">이메일</label>
           		    </div>
            
            	<input type="submit" name="" value="비밀번호 찾기">
        	</form>
    </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>	
</body>
</html>