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
<title>게시판</title>
<link href="css/sy/postList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div>
	<table>
		<thead>		
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>	
		<tbody>
			 <c:forEach items="${postSelect}" var="post">
				<tr>
					<td><c:out value="${post.post_code }"/></td>
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

	<select name="searchType" id="searchType">
		<option value="post_title">제목</option>
		<option value="post_ctx">본문</option>
		<option value="user_id">작성자</option>
 	</select>
 	
 	<div>
	 	<input type="text" name="keyword" id="keyword">
	 	<button name="btn-search" id="btnSearch">검색</button>
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
	
	<a href="<c:url value='/postInsert'/>" role="button" id="btnInsert">글작성</a>
	<c:url var="postListURL" value="/postList"></c:url>
	
<script>
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${postList}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	
	});	
	
	var result = "${result}";        
       if (result === "InsertSuccess") {
           alert("작성이 완료되었습니다.");
           
       } else if (result === "UpdateSuccess") {
           alert("수정이 완료되었습니다.");
       }           
       } else if (result === "DeleteSuccess") {
           alert("삭제가 완료되었습니다.");
       }    
   }    
</script>
</body>
</html>