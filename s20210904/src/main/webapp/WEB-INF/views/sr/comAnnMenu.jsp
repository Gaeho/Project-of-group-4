<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="myPageMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
		<!-- <input type="button" value="진행중()" onclick="location.href='ComAppStatus?id=0'"> -->
		<select onchange="location.href='ComAnn?id=0'">
			<option value="" selected disabled hidden>진행중</option>
			<option>공고 1</option>
			<option>공고 2</option>
			<option>공고 3</option>
		</select>
		<!-- <input type="button" value="마감()" onclick="location.href='ComAppStatus?id=1'"> -->
		<select onchange="location.href='ComAnn?id=1'">
			<option value="" selected disabled hidden>마감</option>
			<option>공고 1</option>
			<option>공고 2</option>
			<option>공고 3</option>
		</select>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div class="comAnnMenu">
			<c:forEach var="announce" items="${listAnn }">
				<div class="divTableCol">
					<div class="divTableRow">${num}</div>
				</div>
				<a href="#" class="comAnn"> 공고 : ${announce.anno_title } </a>
				<c:set var="num" value="${num - 1 }"></c:set>
			</c:forEach>
		</div>
		<input class="annoWrite" type="button" value="공고 작성하기"
			onclick="location.href='DjAnnoWriteForm'">
	</div>
	<div class="page11">
		<input type="hidden" id="mainsearch" value="${mainsearch1}">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="search?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="#" onclick="pageMove(${i})">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage}">
			<a href="search?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
		</c:if>

		<script type="text/javascript">
			function pageMove(vCurrentpage)
			{
			alert("vCurrentpage->"+vCurrentpage);
			var mainsearch = $('#mainsearch').val();
			alert("mainsearch->"+mainsearch);
			location.href="search?currentPage="+vCurrentPage+"&mainsearch="+mainsearch;
			}
		</script>
	</div>
</body>
</html>