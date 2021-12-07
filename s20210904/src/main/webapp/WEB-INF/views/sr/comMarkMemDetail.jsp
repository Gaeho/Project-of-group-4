<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/sr/comMarkMemDetail.css" rel="stylesheet" type="text/css">
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
		<a href="#" id="ComMylogo"> <img class="testcss" src="${company1.com_img}" /></a>
		<div class="CompanyMypageMenu" style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> <a
				class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br>
			<a class="menuBox" href="ComAnn"><span>채용공고</span></a><br>
			<a class="menuBox" href="bookmarkList"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemberSearch"><span>검색</span></a>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		
<!-------------------------------------------------------------------------------------------------------------------->
		
	 <div class="ComBookmarkDetail">
	   <div class="user">
	     <table class="resume">
	     	<h2>이력서</h2>
	     	<tr><th>이름</th><td>${memresume.user_name}</td></tr>
	      	<tr><th>이메일</th><td>${memresume.res_email}</td></tr>
	      	<tr><th>제목</th><td>${memresume.res_title}</td></tr>
	      	<tr><th>고등학교</th><td>${memresume.hs_name}</td></tr>
	      	<tr><th>이력서 내용</th><td>${memresume.cov_let}</td></tr>
	      	
	     	 
	     	
	     
	     </table>
	      
	      <table class="user_info">
	      	<h2>기본 정보</h2>
	      	<tr><th>프로필</th><td><img src="${mem.user_img}">
	      	<%-- <img class="memberImg" src="${mem.user_img}"/> --%></td></tr>
	      	<tr><th>이름</th><td>${mem.user_name}</td></tr>
	      	<tr><th>이메일</th><td>${mem.user_email}</td></tr>
	      	<tr><th>전화번호</th><td>${mem.user_tel}</td></tr>
	      	<tr><th>주소</th><td>${mem.user_addr}</td></tr>
	      </table>
	      
	      <!-- <table class="user_info2">
	      	<h2>원하는 연봉</h2>
	      	<tr><td></td></tr>
	      </table> -->
	      
	      <table class="user_info2">
	      	<tr><th>원하는 직종</th><td>${jobtag.comm_ctx}</td></tr>
	      </table>
	
		 
	   </div>
	</div>
</div>

<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="ComMarkMember?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
	<a href="ComMarkMember?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="ComMarkMember?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>

<!-------------------------------------------------------------------------------------------------------->	

<%@ include file="footer.jsp" %>

</body>
</html>