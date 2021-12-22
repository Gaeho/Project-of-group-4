<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인아이디찾기</title>
<link rel="stylesheet" href="css/sh/findId.css" type="text/css">
<script type="text/javascript">

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
   <%--      <c:if test="${user_id!=null }"> 찾는 개인 아이디 : ${user_id}</c:if><p> --%>
		
		<div class="Shcontainer" >
			<div class="main">
		      <h2>개인아이디 찾기</h2>
			<form action="findIdForm"  >
				
				<div>
					<input type="text" name="user_name" id="user_name"  placeholder="이름을 입력하세요"  >
					<label for="user_name">이름</label>
				</div>
				
				<div>					
					<input type="email" name="user_email" id="user_email"  placeholder="이메일을 입력하세요">
					<label for="user_email">이메일</label>
				</div>
				
				<input type="submit" value="아이디 찾기">
			</form>
			<c:if test="${user_id!=null }">
				<div >
				     <p><P><p><p><p>
					<label for="user_email">찾는 개인 아이디</label> 
					<input type="text" name="findId" id="findId"  value="${user_id}"  >
				</div>
	      </c:if>
	      </div>
		</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>