<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="comInfoUpdat">
			<form action="comInfo"  class="update-form">
				<div class="update-form-in">
					<div id="updateText">
						<h2>비밀번호를 입력해 주세요</h2>
					</div>
					<p>
					<div id="inputPwforUpdate">
							Password : <input type="text" name="com_pw">
					</div>
					<p>
					<c:if test="">
					
					</c:if>
						<button class="pwCheckBtn" onclick="">취소</button>
						<button class="pwCheckBtn" onclick="ComInfoUpdateDetail">확인</button>
				</div>
			</form>
		</div>
</body>
</html>