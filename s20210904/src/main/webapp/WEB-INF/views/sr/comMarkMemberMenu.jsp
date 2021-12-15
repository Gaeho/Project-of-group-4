<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<%@ include file="myPageMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/sr/BookmarkList.css" rel="stylesheet" type="text/css">
<title>ComMypage</title>
</head>
<body>
	<div class="CompanyMypageContainer">
		<div class="comMarkMemberMenu">
			    <table class="bookmarkList">
				  <tr>
				    <th>회원 프로필</th>
				    <th>회원 아이디</th>
				    <th>북마크 날짜</th>
				  </tr>
				
			<c:forEach var="bookmarkList" items="${bookmarkList }">
				<tr>
				  <td><img class="memberImg" src="${bookmarkList.user_img}"/></td>
				  <td><a href="detail2?user_id=${bookmarkList.user_id }&com_id=${bookmarkList.com_id}&mrk_res_code=${bookmarkList.mrk_res_code}">${bookmarkList.user_id}</a></td>
				  <td>${bookmarkList.mrk_date}</td> 
				  <td>${bookmarkList.mrk_res_code}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
<%-- <div class="page11">
		<input type="hidden" id="bookmarkList" value="${bookmarkList}">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="bookmarkList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="#" onclick="pageMove(${i})">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage}">
			<a href="bookmarkList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
		</c:if> --%>

		<!-- <script type="text/javascript">
			function pageMove(vCurrentpage)
			{
			alert("vCurrentpage->"+vCurrentpage);
			var bookmarkList = $('#bookmarkList').val();
			alert("bookmarkList->"+bookmarkList);
			location.href="bookmarkList?currentPage="+vCurrentPage+"&bookmarkList="+key;
			}
													
		</script> 
	</div> -->
</body>
</html>