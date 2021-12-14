<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	/*  function apply() {
		alert("이력서 제출이 완료되었습니다.");
	} */ 
/* 
	function apply() {
		var result = confirm("선택한 이력서를 제출하시겠습니까?")
		if(result == true){
			document.removefrm.submit();
		}else{
			return false;
		}
	}	 */

</script>
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>

<!------------------------------------------------------------------------------------------------------------->

<div id="container">
	<div class="resume">
		<div class="resume_title">
		  <form action="applyResume"> 
		  <h2> 이력서 목록 </h2>
			<table>
				<tr>
				 	<th>선택</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<tr>
				    <td><input type="hidden" name="anno_code" value="${anno_code}"></td> 
					<td><input type="hidden" name="user_id" value="${user_id}"></td>
				 </tr>
				 <c:forEach var="resume" items="${listres}" varStatus="status">
					<tr>
						<td><input type="radio" name="res_code" checked="checked" value="${resume.res_code }" ></td>
					    <td>${resume.res_title}</td> 
						<td>${resume.res_date}</td> 
				      <%--   <td><input type="hidden" name="anno_code" value="${resume.anno_code}"></td>  --%>
				    </tr>    
				</c:forEach>
				
				<td>anno_code->${anno_code}</td>
				<td><input type="submit" value="제출하기" onclick="location.href='applyDetail?user_id=${user_id}&anno_code=${anno_code}'" ></td>
			
			</table>
		 </form>
		</div>
		
		<div class="page">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<a href="GmAnnoList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
				<a href="GmAnnoList?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage}">
				<a href="GmAnnoList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
			</c:if>
		</div>
	</div>
</div>


<!------------------------------------------------------------------------------------------------------------->

<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>