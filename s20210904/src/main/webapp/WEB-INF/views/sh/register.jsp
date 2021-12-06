<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인회원가입</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/sh/register.css" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
</head>
<!-- 헤더부분 -->
<header>
<div id="container">
	<div class="header">	
		<div class="nav">
			<!--Logo Section -->
			<div class="nav_logo">
				<a href="#"><img src="images/logo.png" width="50px" height="50px"></a>
			</div>
			<!-- Search Section -->
			<form action="">
				<div class="search">
				<select class="search-cate" name="searchCate" size="1">
					    <option value="announce">공고</option>
						<option value="board">게시판</option>
				</select> 
					<input type="text" class="search-content" name="searchContent" placeholder="검색어 입력" required="required">
				</div>
			</form>
			<!--Menu Section -->
			<ul class="nav_menu">						
				<li><a href="register">회원가입</a></li>																				
				<li><a href="login">로그인</a></li>													
			</ul>		
		</div>
		<div class="nav2">
			<ul class="nav_menu2">						
				<li><a href="">채용정보</a></li>																				
				<li><a href="">게시판</a></li>													
			</ul>	
		</div>
	</div>
</div>
</header>

<body>
	
	
	<div class="register">
		<form action="joinSave">
		<h2>회원가입</h2>
		<input type="button" value="회원" >
		<input type="button" value="기업"  onclick="location.href='Comjoin'"><p>
		<div class="registerFormWrapper">	
			<div class="registerFormRow">
				<div class="registerFormLabel">아이디</div>
				<div class="registerFormInputBox">
					<input type="text" id="id" name="user_id" placeholder="아이디입력하시오"><p>
					</div>
					</div>
			
			<div class="registerFormRow">
						<div class="registerFormLabel">비밀번호</div>
						<div class="registerFormInputBox">		
		 <input type="password" name="user_pw" placeholder="비밀번호입력하시오"><p>
			</div>
					</div>
				
				<div class="registerFormRow">
						<div class="registerFormLabel">이름</div>	
						<div class="registerFormInputBox">		
		 <input type="text" name="user_name" placeholder="이름을 입력하시오"><p>
		</div>
					</div>
				<div class="registerFormRow">
						<div class="registerFormLabel">성별</div>
							<div class="registerFormInputBox">		
		 <input type="radio" id="male" name="user_sex" value="m">
				 <label for="male">남성</label>
		 <input type="radio" id="female" name="user_sex" value="f">
				 <label for="female">여성</label><p>
				 </div>
					</div>
				 <div class="registerFormRow">
						<div class="registerFormLabel">생년월일</div>	
							<div class="registerFormInputBox">	
			  <input type="text"  name="user_brh" placeholder="생년월일을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">학력</div>
							<div class="registerFormInputBox">	
			  <input type="text" name="user_edu" placeholder="학력을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">주소</div>
						<div class="registerFormInputBox">	
			<input type="text" name="user_addr" placeholder="주소를 입력하시오"><p>
			</div>
					</div>
						 <div class="registerFormRow">
						<div class="registerFormLabel">번호</div>
				        <div class="registerFormInputBox">	
		<input type="text" name="user_tel" placeholder="번호를입력하시오">	<p>
		</div>
					</div>
						<div class="registerFormRow">
						<div class="registerFormLabel">이메일</div>
						 <div class="registerFormInputBox">	
		<input type="text" name="user_email" placeholder="email입력하시오">
	    <input type="submit" value="이메일 인증"><p>
			 	</div>
					</div>	
		 <input type="submit" value="회원가입">
			
		</form>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>