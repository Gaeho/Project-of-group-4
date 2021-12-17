<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="css/sy/post.css" rel="stylesheet" type="text/css">
<link href="css/sy/postView.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="container">
	 <form role="form" method="post">
     	<input type="hidden" name="post_code" value="${postView.post_code}">
     </form>
   <div class="table-responsive">
	<table class="table table-borderless">
		<tr class="table-heading"><td>제목</td></tr>
		<tr><td><input type="text" class="form-control" name="post_title" value="${postView.post_title}" readonly="readonly" /></td></tr>
		<tr class="table-heading"><td>내용</td></tr>
		<tr><td><textarea class="form-control" rows="5" name="post_ctx" readonly="readonly">${postView.post_ctx}</textarea></td></tr>
		<tr class="table-heading"><td>작성자</td></tr>
		<tr><td><input type="text" class="form-control" name="user_id" value="${postView.user_id}" readonly="readonly"/></td></tr>
		<tr class="table-heading"><td>등록일</td></tr>
		<tr><td><input type="text" class="form-control" name="post_regdate" value="${postView.post_regdate}" readonly="readonly"/></td></tr>		
	</table>
	</div>
	<div>
		<button type="submit" class="btn btn-sm btn-primary" id="btnReply">답글</button>
		<button type="submit" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
		<button type="submit" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
		<button type="button" class="btn btn-sm btn-primary" id="btnPrev">이전</button>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {	
	    var form = $("form[role='form']");
	    console.log(form);
	    
	    $("#btnReply").on("click", function () {
	        form.attr("action", "${pageContext.request.contextPath}/postReply");
	        form.attr("method", "get");
	        form.submit();
	    });
	
	    $("#btnUpdate").on("click", function () {
	        form.attr("action", "${pageContext.request.contextPath}/postUpdate");
	        form.attr("method", "get");
	        form.submit();
	    });
	
	    $("#btnDelete").on("click", function () {
	       form.attr("action", "${pageContext.request.contextPath}/postDelete");
	       form.submit();
	    });
	
	    $("#btnPrev").on("click", function () {
	        history.go(-1);
	    });
	
	});
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>