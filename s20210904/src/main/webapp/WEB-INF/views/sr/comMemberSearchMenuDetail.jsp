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
		<%-- <c:set var="num" value="${pg.total-pg.start+1 }"></c:set> --%>
		<div class="compAppStatus_in">
			<table>
				<tr>
					<th>회원프사</th>
					<th>회원 아이디</th>
					<th>이력서 제목</th>
					<th>지원날짜</th>
					<!-- <th>지원 공고</th> -->
				</tr>

				<c:forEach var="memResumeBmarkList" items="${memResumeBmarkList }">
					<tr>
						<td><img class="MemImg" src="${memResumeBmarkList.user_img }" /></td>
						<td><a
							href="detail2?user_id=${memResumeBmarkList.user_id }&com_id=${com_id}&mrk_res_code=${memResumeBmarkList.mrk_res_code}&isResume=1">${memResumeBmarkList.user_id}</a></td>
						<td>${memResumeBmarkList.res_title}</td>
						<td>${memResumeBmarkList.res_date}</td>
						<%-- <td>${}</td> --%>
					</tr>
				</c:forEach>
			</table>
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

</body>
</html>