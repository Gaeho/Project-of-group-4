<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link href="css/sy/post.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="container">
	<form role="form" action="postInsert" method="post">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postInsert.user_id}">	
	<div class="table-responsive">
		<table class="table table-borderless">
			<tr class="table-heading"><td>제목</td></tr>
			<tr><td><input type="text" class="form-control" name="post_title" id="post_title" value=""/></td></tr>
			<tr class="table-heading"><td>내용</td></tr>
			<tr><td><textarea class="form-control" row="10" name="post_ctx" id="post_ctx"></textarea></td></tr>
		</table>
		</div>
	<div>
		<button type="submit" class="btn btn-sm btn-primary">저장</button>				
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
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>