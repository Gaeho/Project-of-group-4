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
<title>게시글 상세</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="post_title" value="${postView.post_title}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="post_ctx" value="${postView.post_ctx}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="user_id" value="${postView.user_id}" readonly="readonly"/></td>
		</tr>	
		<tr>
			<td>등록일</td>
			<td><input type="text" name="post_regdate" value="${postView.post_regdate}" readonly="readonly"/></td>
		</tr>			
	</table>
	
	 <form role="form" method="post">
     	<input type="hidden" name="post_code" value="${postView.post_code}">
     </form>
     
	<div>
		<button type="submit" id="btnReply">답글</button>
		<button type="submit" id="btnUpdate">수정</button>
		<button type="submit" id="btnDelete">삭제</button>
		<button type="submit" id="btnList">목록</button>
	</div>
	
<script>
	$(document).ready(function () {
	
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	
	    $("#btnUpdate").on("click", function () {
	        formObj.attr("action", "/postUpdate");
	        formObj.attr("method", "get");
	        formObj.submit();
	    });
	
	    $("#btnDelete").on("click", function () {
	       formObj.attr("action", "/postDelete");
	       formObj.submit();
	    });
	
	    $("#btnList").on("click", function () {
	       self.location = "/postList"
	    });
	
	});
</script>
</body>
</html>