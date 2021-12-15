<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="myPageMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
			<div class="comMemberSearch">
				<form class="search_form" action="SrSearch">
				 	<input class="search_keyword" name="keyword" type="text" placeholder="검색어를 입력하세요"/>
               		<button class="search_bnt" type="submit">search</button>
				</form>
			</div>
		
		
		
	<%-- 	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div>
			
		
			<div class="comMemberSearch_list">
				<c:forEach var="memResumeBmarkList" items="memResumeBmarkList">
				<div class="divTableCol">
						<div class="divTableRow">${num}</div>
					</div>
				<a href="#" class="memResumeBmark">
			 		회원 프사 : ${memResumeBmarkList.user_img }
					회원 아이디 : ${memResumeBmarkList.user_id }
			 이력서 작성 날짜 : ${memResumeBmarkList.res_date} 
				</a>
				<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</div> 
		</div>	 --%> 
	</div>
	
<%-- 	
	<div class="paging">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="ComAppStatus?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="ComAppStatus?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage }">
			<a href="CComAppStatus?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
		</c:if>
	</div>
	 --%>
</body>
</html>