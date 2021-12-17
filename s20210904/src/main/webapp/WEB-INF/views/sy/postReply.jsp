<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 등록</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<form action="postInsert" method="post">
		<input type="hidden" name="post_code" value="${postViewReply.post_code}">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postViewReply.user_id}">
		<input type="hidden" name="ref" value="${postViewReply.ref}">
		<input type="hidden" name="ref_step" value="${postViewReply.ref_step}">
		<input type="hidden" name="ref_lev" value="${postViewReply.ref_lev}">
   <table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="post_title" id="post_title" value="[답변]${postViewReply.post_title}"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" name="post_ctx" id="post_ctx"></textarea></td>
		</tr>		
   </table>
   			<input type="submit" value="저장">	
	</form>
</body>
</html>