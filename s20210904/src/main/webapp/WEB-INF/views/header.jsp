<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Landing Page - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
  <!-- Navigation-->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="main">Codingmon</a>
                <ul class="nav nav-pills">
                    <li class="nav-item">
                      <a class="nav-link" href="#">공고</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">게시판</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Dropdown</a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#scrollspyHeading3">Third</a></li>
                        <li><a class="dropdown-item" href="#scrollspyHeading4">Fourth</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#scrollspyHeading5">Fifth</a></li>
                      </ul>
                    </li>
              </ul>
              id = ${id }
              <c:choose>
              	<c:when test="${id == null || id =='' }"> 					<!-- 로그인 NO -->
              		<a class="btn btn-primary" href="login">Login</a>
              	</c:when>
              	<c:when test="${id == 'rhksflwk0000'}">						<!-- 관리자 한명만있음ㅋ -->
              		<ul class="nav">
              			<li><a class="btn btn-primary" href="logout">Logout</a></li>
              			<li><a class="btn btn-primary btn-mypage" href="AdminMain">Admin</a><li>
              		</ul>
              	</c:when>
              	<c:otherwise>						<!-- 로그인 OK -->
              		<ul class="nav">
              			<li><a class="btn btn-primary" href="logout">Logout</a></li>
              			<li><a class="btn btn-primary btn-mypage" href="MyPage">MyPage</a><li>
              		</ul>
              	</c:otherwise>
              </c:choose>
            </div>
        </nav>
        
        <input type="radio" name="tabmenu" id="tab01" checked="checked">
				<img src="img/dss/alram-on" onclick="alramOn()">
			
				<div class="alram-list">
				</div> 
</body>
