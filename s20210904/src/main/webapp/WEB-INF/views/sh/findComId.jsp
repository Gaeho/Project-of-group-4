<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업 아이디 찾기</title>
<link rel="stylesheet" href="css/header.css" type="text/css">

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
				<li><a href="join">회원가입</a></li>																				
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

	<h2>기업 아이디 찾기</h2>
  <c:if test="${com_id!=null }"> 찾는 기업 아이디 : ${com_id}</c:if><p>
		<div class="findComId">
			<form action="findComIdForm" >
				회사명 : <input type="text" name="com_name"   placeholder="회사명을 입력하세요"><p>
				담당자명  : <input type="text" name="com_user"   placeholder="담당자명을 입력하세요">	<p>
				사업자 등록번호 : <input type="text" name="com_regnum"   placeholder="사업자등록번호를 입력하세요"><p>
				이메일 : <input type="text" name="com_email"   placeholder="이메일을 입력하세요"><p>
				
				
				<input type="submit" value="아이디찾기">
			</form>
		</div>
</body>
</html>