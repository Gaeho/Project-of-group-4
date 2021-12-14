<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="body">

<%@ include file="/WEB-INF/views/ds/AdminNav.jsp" %>
		<div id="memberListbox" class="memberListbox" >
				<span class="subject">회원관리</span>
				<form action="memberMenu">
					<span class="search"><input type="text" name ="searchTxt" class="searchTxt"><input type="submit" value="검색" class="searchBtn"></span>
				</form>
				<table class="memberList">
					<tr class="title">
						<th >아이디</th><th>이름</th><th></th>
					</tr>
					<c:if test="${mtotCnt==0 }">
						<tr><td colspan="3">회원목록이 비어있어욤</td></tr>
					</c:if>
					<c:if test="${mtotCnt > 0 }">
						<c:forEach var="usList" items="${userList}">
							<tr>
								<td>${usList.user_id}</td><td>${usList.user_name}</td><td><input type="button" value="삭제" onclick="memberDelete('${usList.user_id}')"></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<ul class="pageBtn">
					<li><c:if test="${pg.startPage > pg.pageBlock }">
						<a href="memberMenu?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a></c:if>
					</li>
					<li><c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<a href="memberMenu?currentPage=${i}">[${i}]</a></c:forEach>
					</li>
					<li><c:if test="${pg.endPage < pg.totalPage }">
						<a href="memberMenu?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a></c:if>
					</li>
				</ul>

		</div>
	</div>
</body>
<script type="text/javascript">
		function memberDelete(Vuser_id){
			 console.log(Vuser_id);
			$.ajax({
				url:"<%=context%>/memberDel",  
				data:{user_id : Vuser_id},
				dataType:'Json',
				success:function(data){     
					location.reload();
				}
			});

		}
</script>
</html>