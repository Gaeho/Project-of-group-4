<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업로그인</title>
<link rel="stylesheet" href="css/sh/login.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>					
					
					<div id="Shcontainer">
							<div class="main">
									<form action="ComloginForm"  method="post" class="main__form">
											<h1>Login</h1>
						
										<div class="main__form__find">
											<label for="sign_id">아이디</label>
											<input type="text" id="id"  name="com_id"  placeholder="Enter id">
										</div>
						
										<div class="main__form__find">
											<label for="sign_pw">비밀번호</label>
											<input type="password"  name="com_pw"  placeholder="Enter password">
										</div>
						
										<div class="main__form__link">
											<a href="login">개인이라면 여기를 눌러주세요!</a>
						
											<a href="Comjoin"> <p>코딩몬이 처음이신가요?그럼 우리와 함께 할 수 있는 계정을 만들어 보아요 :)</p></a>
										</div>
						
										<div class="form__find__button">
											<button type="submit" class="form__find__btn">LOGIN</button>
										</div>
						
										<div class="form__find__border">
											<p>or</p>
										</div>
						
										<div class="form__find__bottom">
											<a href="findComId">아이디를 잊으셨나요?</a>
											<a href="findComPw">비밀번호를 잊으셨나요?</a>
										</div>
									</form>
							</div>
					</div>
				
		<%@ include file="/WEB-INF/views/footer.jsp"%>					
</body>

</html>