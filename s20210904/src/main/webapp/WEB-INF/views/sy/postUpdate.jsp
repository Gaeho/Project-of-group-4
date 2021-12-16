<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="css/sy/postView.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<form action="postUpdate" method="post">
		<input type="hidden" name="post_code" value="${post.post_code}">
		<input type="hidden" name="user_id" value="${post.user_id}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="post_title" value="${post.post_title}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" id="post_ctx" name="post_ctx" value="${post.post_ctx}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${post.user_id}</td>
			</tr>		
		</table>	
		<!-- <input type="submit" id="btnUpdate" >수정</button> -->
    	<input type="submit" value="수정">
	</form>
	
	<div>
		<button type="button" id="btnPrev">이전</button>
		<button type="button" id="btnList">목록</button>
	</div>

<script type="text/javascript">
	$(document).ready(function () {
	
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	
	
	    $("#btnPrev").on("click", function () {
	        history.go(-1);
	    });
	
	    $("#btnList").on("click", function () {
	        self.location = "${pageContext.request.contextPath}/postList"
	    });
	
	});
</script>
</body>
</html>