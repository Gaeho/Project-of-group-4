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
<title>검색->공고페이지</title>


</head>
<body>
<div class="Container">
	

	
	<div class="MyContainer">
			
			<div class="search_anno">
				<div class="search_anno_title">
				  <h2> 검색된 공고 </h2>
				   <h4>검색어: ${mainsearch1}</h4><p>
					<table>
						<tr>
							<th>이미지</th>
							<th>제목</th>
							<th>회사명</th>
							<th>직종</th>
							<th>경력</th>
							<th>학력사항</th>
							<th>고용형태</th>
							<th>고용인원</th>
						</tr>
						 <c:forEach var="annoResult" items="${annoResult}">
							<tr>
							    <td>${annoResult.com_img}</td>
								<td><a href="detail?anno_code=${annoResult.anno_code}">${annoResult.anno_title}</a></td>
								<td>${annoResult.com_name}</td>
								<td>${annoResult.jobgroup}</td>
								<td>${annoResult.workex}</td>
								<td>${annoResult.rec_edu}</td>
								<td>${annoResult.employform}</td>
								<td>${annoResult.rec_vol}</td>
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

</div>
</body>
</html>