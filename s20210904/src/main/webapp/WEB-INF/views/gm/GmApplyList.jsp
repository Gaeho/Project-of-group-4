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

<%-- 
	/* EmpController */
	function apply_chk(){
		alert(" apply_chk Start..");  
		var user_id = $("#user_id").val();
		var res_code = $("#res_code").val();
		alert("apply_chk user_id->"+ user_id); 
		alert("apply_chk res_code->"+ res_code); 
		
	 	$.ajax({
			url:"<%=context%>/applychk",
			data:{"user_id"   : user_id,
			      "res_code"  : res_code
			      },	/*  */
			dataType:'text',			/* 서버에서 내려온 data 형식 */
			success:function(data){		/* 요청이 성공됬을때 실행되는 callback 함수 */
				alert("success data"+data);  
				window.opener.location.reload();
				self.close();
			},
			
			error:function(){
				alert("에러 발생");
				self.close();
			}
			
		}); 
		
	} --%>

</script>
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>

<!------------------------------------------------------------------------------------------------------------->

<div id="container">
	<div class="resume">
		<div class="resume_title">
		  <h2> 이력서 목록 </h2>
			<table>
				<tr>
				 	<th>선택</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				 <c:forEach var="resume" items="${listres}"  varStatus="status">
					<tr>
						<%-- <td><input type="checkbox" id="resume" name="resume" value="${resume.res_code }"  onclick="getCheckbox(${resume.res_code })"> --%>
								<td><input type="radio" name="res_code" checked="checked" value="${resume.res_code }" ></td>
			
					    <td><%-- <a href="detail?anno_code=${listres.anno_code}"> --%>${resume.res_title}</td> 
						<td>${resume.res_date}</td> 
				        <td><input type="hidden" name="user_id" value="${resume.user_id}"></td> 
				      <%--   <td><input type="hidden" name="anno_code" value="${resume.anno_code}"></td>  --%>
				        
					</tr>
				</c:forEach>
				<td><input type="submit" value="제출하기" ></td>
					<!-- user_id : <input type="text" id="user_id"    value="siasia54" > 
					res_code : <input type="text" id="res_code"    value="1" >  -->
			
			</table>
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