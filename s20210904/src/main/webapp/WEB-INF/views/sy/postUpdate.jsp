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
<div class="container">
	<form action="postUpdate" method="post">
		<input type="hidden" name="post_code" value="${post.post_code}">
		<input type="hidden" name="user_id" value="${post.user_id}">
<div class="table-responsive">
	<table class="table align-middle">
			<tr>
				<td>제목</td>
				<td><input type="text" class="form-control" name="post_title" value="${post.post_title}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<<td><textarea class="form-control" rows="5" name="post_ctx">${postView.post_ctx}</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" class="form-control" name="user_id" value="${postView.user_id}" readonly="readonly"/></td>
			</tr>		
		</table>
		</div>	
		<!-- <input type="submit" id="btnUpdate" >수정</button> -->
    	<button type="submit" class="btn btn-sm btn-primary">수정</button>
	</form>
	
	<div>
		<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
	
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	
	    $("#btnList").on("click", function () {
	        history.go(-1);
	    });
	
	});
</script>
</body>
</html>