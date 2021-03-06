<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comMemberSearch.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="CompanyMypageContainer">
		<div class="comInfoMenu">
			<div class="comInfoUpper">
				<div>
					<h1>마이페이지</h1>
				</div>
			</div>
			
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
					<div class="comInfoSearch">
						<form class="search_form" action="SrSearch">
								<input class="search_keyword" name="keyword" type="text" placeholder="검색어를 입력하세요" />
								<button class="search_bnt" type="submit">search</button>
						</form>
					</div>
					<table class="table table-hover" style="vertical-align:middle">
						<thead class="table-light">
						<tr>
							<th>회원프사</th>
							<th>회원 아이디</th>
							<th>이력서 제목</th>
						</tr>
						</thead>
						<c:forEach var="memResumeBmarkList" items="${memResumeBmarkList }">
						<tr>
							<td><img class="MemImg" src="${memResumeBmarkList.user_img }" /></td>
							<td><a href="detail2?user_id=${memResumeBmarkList.user_id }&com_id=${com_id}&mrk_res_code=${memResumeBmarkList.mrk_res_code}&isResume=1">${memResumeBmarkList.user_id}</a></td>
							<td>${memResumeBmarkList.res_title}</td>
						</tr>
						</c:forEach>
					</table>
					<%-- <c:if test="${not empty }">
 						<a href="logoutPro.do">LOGOUT</a>
 					</c:if>
 					<c:if test="${empty }">
 						<a href="loginForm.do">LOGIN</a>
 					</c:if> --%>
				</div>
			</div>
		</div>
	</div>
	<div class="page11">
		<input type="hidden" id="keyword" value="${keyword1}">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="SrSearch?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="#" onclick="pageMove(${i})">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage}">
			<a href="SrSearch?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
		</c:if>

		<script type="text/javascript">
			function pageMove(vCurrentpage)
			{
			alert("vCurrentpage->"+vCurrentpage);
			var keyword = $('#keyword').val();
			alert("keyword->"+keyword);
			location.href="SrSearch?currentPage="+vCurrentPage+"&keyword="+key;
			}
		</script>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>