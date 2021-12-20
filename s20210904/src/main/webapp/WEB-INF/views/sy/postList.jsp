<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="css/sy/postList.css" rel="stylesheet" type="text/css">
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
	<form action="postList" class="form-inline ml-auto">
		<input type="hidden" name="currentPage" value="${paging.currentPage}" >
		 <div class="col-lg-4">
		<input type="text" class="form-control" value="${post_search}" name="searchText" id="post_search" placeholder="검색어를 입력하세요">
		</div>	
		<button type="submit" class="btn btn-sm btn-primary">검색</button>	
		
<div class="table-responsive">
	<table class="table table-hover">	
		<c:forEach items="${postNotice}" var="postnotice">                     
             <tr>
                <td><c:out value="${postnotice.brd_code }"/></td>
                <td><c:out value="${postnotice.user_id}"/></td>
                <td><a href="postView?post_code=${postnotice.post_code}">${postnotice.post_title}</a></td>
                <td><c:out value="${postnotice.post_view}"></c:out></td>
                <td><c:out value="${postnotice.post_regdate}"/></td>
             </tr>
       </c:forEach>
		 <c:forEach items="${postSelect}" var="post">
			<tr>
				<td><c:out value="${post.brd_code }"/></td>
			    <td><c:out value="${post.user_id}"/></td>
				<td><a href="postView?post_code=${post.post_code}">${post.post_title}</a></td>
				<td><c:out value="${post.post_view}"></c:out></td>
				<td><c:out value="${post.post_regdate}"/></td>
			</tr>
		</c:forEach>	
	</table>
	</div>
		<div class="row">
			<div class='col-md-12 text-center'>
			<c:if test="${paging.startPage > paging.pageBlock }">
			<a href="postList?currentPage=${paging.startPage-paging.pageBlock}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<a href="postList?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${paging.endPage < paging.totalPage}">
			<a href="postList?currentPage=${paging.startPage + paging.pageBlock}">다음</a>
			</c:if>
		</div>
	</div>
	<div>
		<button type="button" class="btn btn-sm btn-light"><a href="postInsert">글쓰기</button>
	</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function () {	
	    var form = $("form[role='form']");
	    console.log(form);
	    
	    $("#btnInsert").on("click", function () {
	        form.attr("action", "${pageContext.request.contextPath}/postInsert");
	        form.attr("method", "get");
	        form.submit();
	    });
	});

</script>
<br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>