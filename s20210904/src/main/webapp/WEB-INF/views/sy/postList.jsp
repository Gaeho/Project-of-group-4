<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<table>
		<thead>		
			<tr>
				<th>분류</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>	
		<tbody>
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
			<!-- 	<td><c:out value="${post.post_code }"/></td> -->
				<td><c:out value="${post.brd_code }"/></td>
			    <td><c:out value="${post.user_id}"/></td>
				<td><a href="postView?post_code=${post.post_code}">${post.post_title}</a></td>
				<td><c:out value="${post.post_view}"></c:out></td>
				<td><c:out value="${post.post_regdate}"/></td>
			</tr>
		</c:forEach>
		</tbody>	
	</table>
</div>

	<form action="postList" method="post">
		<input type="hidden" name="currentPage" value="${paging.currentPage}" >
		<input type="text" value="${post_search}" name="post_search" id="post_search" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
	</form>

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
	
	<a href="<c:url value='/postInsert'/>" role="button" id="btnInsert">글작성</a>
	<c:url var="postListURL" value="/postList"></c:url>
	
<script>
/* 	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${postList}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	
	});	
	
		var msg = "${result}";        
       if (result === "InsertSuccess") {
           alert("작성이 완료되었습니다.");   
           
       } else if (result === "UpdateSuccess") {
           alert("수정이 완료되었습니다.");
       }           
       } else if (result === "DeleteSuccess") {
           alert("삭제가 완료되었습니다.");
       }     */
       function pageMove(vCurrentPage){
    	   var  post_search = $('#post_search').val();
    	   location.href="postList?currentPage="+vCurrentPage+"&post_search="+post_search;
   }    
</script>
</body>
</html>