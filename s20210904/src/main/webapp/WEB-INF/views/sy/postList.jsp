<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="css/sy/postList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="container">
	<form role="form" action="postList" method="post">
		<input type="hidden" name="currentPage" value="${paging.currentPage}" >
		<input type="text" value="${post_search}" name="post_search" id="post_search" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
	</form>
<div class="table-responsive">
	<table class="table align-middle">	
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
	<div>
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
	<div>
	<button type="button" class="btn btn-sm btn-primary" id="btnInsert">글쓰기</button>
	</div>
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
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>