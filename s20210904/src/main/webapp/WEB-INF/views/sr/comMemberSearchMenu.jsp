<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
<style type="text/css">
.testcss {
	width: 150px;
	height: 150px;
	border: 1px solid black;
}

.menuBox {
	text-decoration: none;
	text-align: center;
	color: white;
	padding: 8px 16px;
	background-color: black;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}

.menuBox:hover {
	color: black;
	background-color: white;
}

.divTableRow {
	text-decoration: none;
	text-align: center;
	color: black;
	padding: 8px 16px;
	background-color: pink;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}

.memberImg {
	width: 100px;
	height: 100px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<div class="CompanyMypageContainer">
		<a href="#" id="ComMylogo"> <img class="testcss"
			src="${company1.com_img}" /></a>
		<div class="CompanyMypageMenu"
			style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> <a
				class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br> <a
				class="menuBox" href="ComAnn"><span>채용공고</span></a><br> <a
				class="menuBox" href="bookmarkList"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemberSearch"><span>검색</span></a>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div>
			<div class="comMemberSearch">
				<input class="search-tag" <%-- value="${ }" --%>>
				<button>search</button>
			</div>
			<div class="comMemberSearch_list">
				<c:forEach var="search_list" items="commMemResume">
				<div class="divTableCol">
						<div class="divTableRow">${num}</div>
					</div>
				<a href="#">
					회원 프사 : ${comMemberResume.user_img }
					회원 아이디 : ${commMemberResume.user_id }
				</a>
				<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</div>
		</div>
	</div>
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
</body>
</html>