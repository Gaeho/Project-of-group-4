<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<link href="css/sr/comMypage.css" rel="stylesheet" type="text/css">
<%-- <%
	String context = request.getContextPath();
% --%>
>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
<!-- <script type="text/javascript">
	function ComAppStatus(id){
		alert(id);
		$.ajax({
			url:"<$=context%>/ComAppStatus",
			data:{id1:id},
			dataType:'text',
			success:function(data){
				alert("성공");
			}
		})
	} -->
	
</script>

</head>
<body>
	<div class="CompanyMypageContainer">
		<a href="#" id="ComMylogo"> <img class="testcss" src="${commCompany1.com_img}" /></a>
		<div class="CompanyMypageMenu" style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> 
			<a class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br> 
			<a class="menuBox" href="ComAnn"><span>채용공고</span></a><br> 
			<a class="menuBox" href="bookmarkList"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemSearch"><span>검색</span></a>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div class="compAppStatus_out">
			<div class="compAppStatus_btn">
				<!-- <input type="button" value="진행중()" onclick="location.href='ComAppStatus?id=0'"> -->
			<!-- 	<select onchange="location.href='ComAppStatus?id=0'"> -->
			<form action="ComAppStatus">
			    <input type="hidden" name="id" value="0">
				<select id="aaaa">
					<option value="" selected disabled hidden>진행중</option>
					<option value="one">공고1</option>
					<option value="two">공고 2</option>
					<option value="three"<%-- ${ "selected":""} --%>>공고 3</option>
				</select>
				
			
				<!-- <input type="button" value="마감()" onclick="location.href='ComAppStatus?id=1'"> -->
				<select onchange="location.href='ComAppStatus?id=1&공고번호=2'">
					<option value="0" selected disabled hidden>마감</option>
					<option value="1">공고 1</option>
					<option value="2">공고 2</option>
					<option value="3">공고 3</option>
				</select>
     </form>
     <div>
     	<input type="submit" value="선택" onclick="location.href='ComAppStatus?id=1'">
     </div>
			</div>
			
			<c:if test="${user_id eq null }">
				<h3>지원자가 없습니다</h3>
			</c:if>
			<div class="compAppStatus_in">
				<table>
					<tr>
						<th>회원프사</th>
						<th>회원 아이디</th>
						<th>지원날짜</th>
					</tr>

					<c:forEach var="appAnnMember" items="${appAnnMember }">
						<tr>
							<td><img class="MemImg" src="${appAnnMember.user_img}" /></td>
							<td><a href="detail2?user_id=${appAnnMember.user_id }&com_id=${appAnnMember.com_id}&mrk_res_code=${appAnnMember.mrk_res_code}&isResume=1">${appAnnMember.user_id}</a></td>
							<td>${appAnnMember.app_regdate }</td>
						</tr>
					</c:forEach>
				</table>
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