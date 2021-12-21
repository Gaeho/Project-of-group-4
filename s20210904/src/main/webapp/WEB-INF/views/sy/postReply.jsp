<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 등록</title>
<link href="css/sy/post.css" rel="stylesheet" type="text/css">
<!-- Font Link -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<br>
<div class="container-sm">
	<a href="postList"><h2 class="h2-style">코딩톡</h2></a>
	<form role="form" action="postInsert" method="post">
		<input type="hidden" name="post_code" value="${postViewReply.post_code}">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postViewReply.user_id}">
		<input type="hidden" name="ref" value="${postViewReply.ref}">
		<input type="hidden" name="ref_step" value="${postViewReply.ref_step}">
		<input type="hidden" name="ref_lev" value="${postViewReply.ref_lev}">
    <div class="table-responsive">
	<table class="table table-borderless">
		<tr class="table-category" name="brd_code">게시판 > ${postViewReply.brd_code} > ${postViewReply.post_title}</tr>
		<tr class="table-heading"><td>제목</td></tr>
		<tr><td><input type="text" class="form-control" name="post_title" id="post_title" value="[답글] ${postViewReply.post_title}"></td></tr>
		<tr class="table-heading"><td>내용</td></tr>
		<tr><td><textarea class="form-control" name="post_ctx" id="post_ctx"></textarea></td></tr>
		<tr class="table-heading"><td>작성자</td></tr>
		<tr><td><input type="text" class="form-control" name="user_id" value="${postViewReply.user_id}" readonly="readonly"/></td></tr>
		<tr class="table-heading"><td>등록일</td></tr>
		<tr><td><input type="text" class="form-control" name="post_regdate" value="${postViewReply.post_regdate}" readonly="readonly"/></td></tr>			
   </table>
   </div>
   <div>
   		<button type="submit" class="btn btn-sm btn-primary">저장</button>
   </div>
	</form>
</div>
<br><br><br><br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>