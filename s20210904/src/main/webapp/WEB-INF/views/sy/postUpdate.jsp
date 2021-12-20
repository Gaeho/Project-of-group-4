<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="css/sy/post.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<br>
<div class="container-sm">
<!-- 	<a href="postList"><h2 class="h2-style">코딩톡</h2></a> -->
	<form role="form" action="postUpdate" method="post">
		<input type="hidden" name="post_code" value="${post.post_code}">
	<div class="table-responsive">
		<table class="table table-borderless">
			<a href="postList"><tr class="table-category" name="brd_code">게시판  >  ${post.brd_code}</tr></a>
			<tr class="table-heading"><td>제목</td></tr>
			<tr><td><input type="text" class="form-control" name="post_title" value="${post.post_title}" /></td><tr>
			<tr class="table-heading"><td>내용</td></tr>
			<tr><td><textarea class="form-control" rows="5" name="post_ctx">${post.post_ctx}</textarea></td></tr>
			<tr class="table-headings"><td>작성자</td></tr>
			<tr><td><input type="text" class="form-control" name="user_id" value="${post.user_id}" readonly="readonly"/></td></tr>
			<tr class="table-headings"><td>등록일</td></tr>
			<tr><td><input type="text" class="form-control" name="post_regdate" value="${post.post_regdate}" readonly="readonly"/></td></tr>		
		</table>
		</div>
	<div>
    	<button type="submit" class="btn btn-sm btn-primary">수정</button>
    	<button type="button" class="btn btn-sm btn-primary" id="btnPrev">이전</button>
    </div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function () {	
	    var form = $("form[role='form']");
	    console.log(form);
	
	    $("#btnPrev").on("click", function () {
	        history.go(-1);
	    });
	});
</script>
<br><br><br><br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>