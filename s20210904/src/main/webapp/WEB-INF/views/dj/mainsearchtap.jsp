<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="css/dj/tapstyle.css" rel="stylesheet" type="text/css">
<title>검색 결과 페이지</title>
</head>
<body>
<!-- <div class="container"> -->
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="bigContainer_mainsearch">
	<div class="DjContainer">
		  
			<div class="tab_content">
				<input type="radio" name="tabmenu" id="tab01" checked="checked">
				<label for="tab01">공고버튼 </label>
				<input type="radio"  name="tabmenu" id="tab02">
				<label for="tab02">회사버튼 </label>
			
					<div class="conbox con1">
							<h2> 검색된 공고 </h2>
							   <h4>검색어: ${mainsearch1}</h4><p>
							   <div class="anno_search_result">
								<table class="table">
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
										    <td><img class="img-thumbnail" alt="이미지없음" src="${annoResult.com_img}" style="widows:50px; height:50px;">  </td>
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
								
								<div class="page11">
									<c:if test="${pg.startPage > pg.pageBlock }">
										<a href="search?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
									</c:if>
									<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
										<a href="search?currentPage=${i}">[${i}]</a>
									</c:forEach>
									<c:if test="${pg.endPage < pg.totalPage}">
										<a href="search?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
									</c:if>
								</div>
					     </div> 
				
			   
			    <div class="conbox con2">
			    		<h2> 검색된 회사 </h2>
						   <h4>검색어: ${mainsearch1}</h4><p>
							<div class="com_search_result">
							<table class="table">
								<tr>
									<th>이미지</th>
									<th>회사명</th>
									<th>주소</th>
									<th>세부내용</th>
								</tr>
								 <c:forEach var="comResult" items="${comResult}">
									<tr>
									    <td><img class="img-thumbnail" alt="이미지없음" src="${comResult.com_img}" style="widows:50px; height:50px;"></td>
										<td><a href="#">${comResult.com_name}</a></td>
										<td>${comResult.com_addr}</td>
										<td>${comResult.com_bus}</td>
									</tr>
								</c:forEach>
							</table>
							</div>
							
							<div class="page22">
								<c:if test="${pg2.startPage > pg2.pageBlock }">
									<a href="search?currentPage=${pg2.startPage-pg2.pageBlock}">[이전]</a>
								</c:if>
								<c:forEach var="j" begin="${pg2.startPage}" end="${pg2.endPage}">
									<a href="search?currentPage=${j}">[${j}]</a>
								</c:forEach>
								<c:if test="${pg2.endPage < pg2.totalPage}">
									<a href="search?currentPage=${pg2.startPage + pg2.pageBlock}">[다음]</a>
								</c:if>
							</div>
								    
				    </div>
				</div>
			</div>			
</div>	
<!-- </div> -->	

	
	
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>