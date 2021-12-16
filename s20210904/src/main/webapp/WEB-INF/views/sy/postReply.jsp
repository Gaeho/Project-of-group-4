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
<title>답글 등록</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<form action="postReply" method="post">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postReply.user_id}">
		<input type="hidden" name="ref" value="${postReply.ref}">
		<input type="hidden" name="ref_step" value="${postReply.ref_step}">
		<input type="hidden" name="ref_lev" value="${postReply.ref_lev}">
   <table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="post_title" value="답글" + "${postReply.post_title}"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10"  name="post_ctx">${postReply.post_ctx}</textarea></td>
		</tr>		
   </table>
   			<input type="submit" value="입력"></input>
	</form>
</body>
</html>