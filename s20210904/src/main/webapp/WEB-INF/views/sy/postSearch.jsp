<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<h2>검색 결과</h2>
	<h4>검색어 : ${searchPost1}</h4>
	<table>
		<tr>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>작성자</th>
		</tr>
		 <c:forEach var="result" items="${result}">
			<tr>
				<td><a href="postView?post_code=${result.post_code}">${result.post_title}</a></td>
				<td>${result.post_regdate}</td>
				<td>${result.post_view}</td>
				<td>${result.user_id}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="post_search" value="${searchPost1}">
		<c:if test="${paging.startPage > paging.pageBlock}">
			<a href="postSearch?currentPage=${paging.startPage-paging.pageBlock}">이전</a>
		</c:if>
		<c:forEach var="j" begin="${paging.startPage}" end="${paging.endPage}">
			<a href="postView?post_code=${post.post_code}" onclick="pageMove(${j})">[${j}]</a>
		</c:forEach>
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="postSearch?currentPage=${paging.startPage + paging.pageBlock}">다음</a>
		</c:if>
		
		<script type="text/javascript">
			function pageMove(vCurrentpage){
				alert("vCurrentpage->"+vCurrentpage);
				var post_search = $('#post_search').val();
				alert("post_search->"+post_search);
				location.href="postSearch?currentPage="+vCurrentPage+"&post_search="+post_search;
				}							
		</script>

</body>
</html>