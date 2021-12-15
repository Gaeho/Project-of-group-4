<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<form action="/postInsert" method="POST">
		<div>
			<label>제목</label>
			<input name="post_title" id="post_title"/>
		</div>
		<div>
			<label>내용</label>
			<textarea name="post_ctx" id="post_ctx"></textarea>
		</div>
		<div>			
			<button type="submit" id="btnSave">작성</button>
			<button type="button" id="btnList">목록</button>
		</div>						
	</form>
	
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();		
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/postList";
	});
</script>
</body>
</html>