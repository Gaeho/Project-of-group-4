<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
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
	<a href="main"><h2 class="h2-style">코딩톡</h2></a>
	<form role="form" action="postInsert" method="post">
		<input type="hidden" name="brd_code" value="Q&A">
		<input type="hidden" name="user_id" value="${postInsert.user_id}">	
	<div class="table-responsive">
		<table class="table table-borderless">
			<tr class="table-heading"><td>제목</td></tr>
			<tr><td><input type="text" class="form-control" name="post_title" id="post_title" placeholder="제목을 입력하세요." value=""/></td></tr>
			<tr class="table-heading"><td>내용</td></tr>
			<tr><td><textarea class="form-control" row="10" name="post_ctx" id="post_ctx" placeholder="내용을 입력하세요."></textarea></td></tr>
		</table>
	</div>
	<div class="row">
	    <div class="col text-left">
			<button type="submit" class="btn btn-sm btn-primary">저장</button>
		</div>
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
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>