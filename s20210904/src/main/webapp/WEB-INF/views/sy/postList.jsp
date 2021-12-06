<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<h1>게시판</h1>

		<form id="postForm" name="postForm" method="post">
			<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일자</th>
					<c:forEach items="${list}" var="result">
					<tr>
						<td><c:out value="${result.user_id}" /></td>
						<td><a href='#' onClick='fn_view(${result.user_id})'>
							<c:out value="${result.post_title }" /></a></td>
						<td><c:out value="${result.post_name}" /></td>
						<td><c:out value="${result.post_reg_date}" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
		
		<button id="btn_write" type="button" class="btn_write">작성</button>
</body>
<script type="text/javascript">
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'postForm.do');
	});

	function fn_view(user_id){
    
  	  var form = document.getElementById("postForm");
  	  var url = "<c:url value='/postDetail.do'/>";
  	  url = url + "?user_id=" + user_id;
    
 	   form.action = url;    
 	   form.submit(); 
	}
</script>
</html>