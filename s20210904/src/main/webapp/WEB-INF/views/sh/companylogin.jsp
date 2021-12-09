<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업로그인</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/sh/companylogin.css" type="text/css">
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


<div class="container">
<div class="Comlogin">
<div class="tab_content">
		<form action="ComloginForm">
		<h2>로그인</h2>
			<input type="radio"  name="tabmenu"  id=tab01" checked="checked"  onclick="location.href='login'">
			<label for = "tab01">회원</label>
			<input type="radio"   name="tabmenu"  id="tab02"  checked="checked"  onclick="location.href='Comlogin'">
			<label for = "tab02">기업</label><p>
			
			아이디 : <input type="text" id="id" name="com_id" placeholder="아이디를 입력하세요"><P>
			비밀번호 : <input type="password" name="com_pw" placeholder="비밀번호를 입력하세요" ><p>
			<input type="submit" value="로그인">
			
			<div class="btn">			
						<input type="button" class="btn1" value="기업아이디 찾기" onclick="location.href='findComId'">
						<input type="button" class="btn2" value="기업비밀번호 찾기" onclick="location.href='findComPw'">
						<input type="button" class="btn3" value="기업회원가입" onclick="location.href='Comjoin'">
					</div>	
	
		</form>
		</div>
	</div>
	</div>
</body>
</html>