<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<form action="postInsert" method="post">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postInsert.user_id}">	
	<!-- 	<input type="hidden" name="post_regdate" value="${postInsert.post_regdate}"> -->	
	<table>
		<tr>  
			<td>제목</td>
			<td><input type="text" name="post_title" id="post_title" value=""/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" name="post_ctx" id="post_ctx" ></textarea></td>
		</tr>
	</table>		
			<input type="submit" value="입력" onClick="location.href='postList'"></input>				
	</form>
		<div>
		<button type="button" id="btnPrev">이전</button>
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