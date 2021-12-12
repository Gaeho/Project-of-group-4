<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/gm/GmAnnoList.css" rel="stylesheet" type="text/css">
<title>코딩몬</title>
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-------------------------------------------------------------------------------------------------------->
<div class="container">
	<div class="annolistContainer">
		<div class="annolist1">
				<div class="annolisttitle"> 
					<h2> 공고 </h2>
				</div>
				
				<div class="annolist1">
					<table class="table table-hover">
							<thead class="table-light">					
								<tr>
									<th scope="col">기업명</th>
									<th scope="col" colspan="2">제목</th>
									<th scope="col">지원자격</th>
									<th scope="col">등록일</th>
									<th scope="col">마감일</th>
								</tr>
							</thead>	
							<tbody>
								 <c:forEach var="comanno" items="${listAnno}">
									<tr>
									    <td>${comanno.com_name}</td>
										<td colspan="2"><a href="detail?anno_code=${comanno.anno_code}">${comanno.anno_title}</a></td>
										<td>${comanno.rec_edu}</td>
										<td>${comanno.anno_regdate} ~</td>
										<td>${comanno.anno_c_regdate}</td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
				</div>
				
				<div class="annolistpage">
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
	</div>
		
	
	<!-------------------------------------------------------------------------------------------------------->
	<br><br><br>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>