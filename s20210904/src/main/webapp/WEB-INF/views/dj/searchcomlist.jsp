<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>검색->회사페이지</title>
</head>
<body>
<div class="Container">
	
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<div class="MyContainer">
			
			<div class="search_com">
				<div class="search_com_title">
				  <h2> 검색된 회사 </h2>
				   <h4>검색어: ${mainsearch1}</h4><p>
					<table>
						<tr>
							<th>이미지</th>
							<th>회사명</th>
							<th>주소</th>
							<th>세부내용</th>
						</tr>
						 <c:forEach var="comResult" items="${comResult}">
							<tr>
							    <td>${comResult.com_img}</td>
								<td><a href="#">${comResult.com_name}</a></td>
								<td>${comResult.com_addr}</td>
								<td>${comResult.com_bus}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="page">
					<c:if test="${pg.startPage > pg.pageBlock }">
						<a href="searchannolist?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<a href="searchannolist?currentPage=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${pg.endPage < pg.totalPage}">
						<a href="searchannolist?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
					</c:if>
				</div>
			</div>
		
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>