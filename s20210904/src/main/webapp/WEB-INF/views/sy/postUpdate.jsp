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
<title>게시글 수정</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form role="form" id="postUpdate" method="post" action="${path}/sy/postUpdate">
	<input type="hidden" name="post_code" value="${post.post_code}">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="post_title" placeholder="제목을 입력해주세요" value="${post.post_title}" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="post_ctx" placeholder="내용을 입력해주세요" >${post.post_ctx}</textarea></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="user_id" value="${post.user_id}" readonly/></td>
		</tr>		
	</table>
	
	<div>
		<button type="submit" id="btnUpdate">수정</button>
		<button type="button" id="btnPrev">이전</button>
		<button type="button" id="btnList">목록</button>
	</div>
</form>

<script>
	$(document).ready(function () {
	
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	
	    $("#btnUpdate").on("click", function () {
	        formObj.submit();
	    });
	
	    $("#btnPrev").on("click", function () {
	        history.go(-1);
	    });
	
	    $("#btnList").on("click", function () {
	        self.location = "/sy/postList"
	    });
	
	});
</script>
</body>
</html>