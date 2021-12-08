<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var param=${paramJson};
</script>
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
			src="${commCompany1.com_img}" /></a>
		<div class="CompanyMypageMenu"
			style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> <a
				class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br> <a
				class="menuBox" href="ComAnn"><span>채용공고</span></a><br> <a
				class="menuBox" href="ComMarkMember"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemberSearch"><span>검색</span></a>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div>
			<div class="comMemberSearch">
				<form action="" name="searchForm">
					<input type="text" name="rev_code" value="${param.rev_code }" >
				<input type="text" name="page" value="1" >
				<select name="searchType">
					<option selected="selected" value="occupation">직종</option>
					<option  selected="selected" value="technology_stack">기술스택</option>
					<option selected="selected" value="com_sec">업종</option>
				</select>
				<script>
					/* $('form[name="searchForm"] selected[name="searchType"]').val(param.searchType); */
					$('form[name="searchForm"]').val(param.earchType).prop("selected", true);
				</script>
				<input type="text" name="searchKeyword" placeholder="태그 검색" value="${param.searchKeyword }" >
				<input type="submit" value="검색">
				</form>
			</div>
			<div class="comMemberSearch_list">
				<c:forEach var="search_list" items="commMemResumes">
				<div class="divTableCol">
						<div class="divTableRow">${num}</div>
					</div>
				<a href="#">
					회원 프사 : ${commMemResume.user_img }
					회원 아이디 : ${commMemResume.user_id }
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