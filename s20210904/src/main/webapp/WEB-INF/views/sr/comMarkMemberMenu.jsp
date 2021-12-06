<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>ComMypage</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	/* EmpController */
	function setBookmark(){
		alert("setBookmark Start..");  
		var com_id = $('#com_id').val()
		var user_id = $('#user_id').val()
		var it_bookmark = $('#it_bookmark').val()
		alert("setBookmark com_id->"+ com_id);  
		alert("setBookmark user_id->"+user_id);  
		alert("setBookmark it_bookmark->"+it_bookmark);  
	
	 	$.ajax({
			url:"<%=context%>/bookmark",
			data:{com_id 	  : com_id,
			      user_id     : user_id,
			      it_bookmark : it_bookmark
			    },	/*  */
			dataType:'text',			/* 서버에서 내려온 data 형식 */
			success:function(data){		/* 요청이 성공됬을때 실행되는 callback 함수 */
					alert("success data"+data);  
					alert("성공");
					/* $('#likebtn').val(data); */
					location.reload(); // 페이지 리로드
			},
			error:function(){
				alert("에러 발생");
			}
			
		}); 
		
	}

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
		<a href="#" id="ComMylogo"> <img class="testcss" src="${company1.com_img}" /></a>
		<div class="CompanyMypageMenu" style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br> <a
				class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br>
			<a class="menuBox" href="ComAnn"><span>채용공고</span></a><br>
			<a class="menuBox" href="ComMarkMember"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemberSearch"><span>검색</span></a>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
		<div class="comMarkMemberMenu">
			    <table>
				  <tr>
				    <th>북마크</th>
				    <th>회원 프로필</th>
				    <th>회원 아이디</th>
				    <th>북마크 날짜</th>
				  </tr>
				
			<c:forEach var="bookmark" items="${listBmark }">
				<tr>
				 <td>
				  	<c:choose>
					    <c:when test="${itbookmark == 0}">
					      <input type="button" class = "btn btn_light" id="likebtn" value="북마크 ☆ " onclick="setBookmark()">
						  <input type="hidden" id="likecheck" value="${itbookmark}">
					    </c:when>
					    
				        <c:when test="${itbookmark == 1}">
					      <input type="button" class = "btn btn_danger" id="likebtn" value="북마크 ★" onclick="setBookmark()">
					      <input type="hidden" id="likecheck" value="${itbookmark}">
					    </c:when>
					  </c:choose>
				  </td>
				
					  com_id	  : <input type="text" id="com_id"      value="tlstprp5184"><p>
				      user_id 	  : <input type="text" id="user_id"     value="dmdtla054"  ><p>
				      it_bookmark : <input type="text" id="it_bookmark" value="1" ><p>
				     
				 
				  <td><img class="memberImg" src="${user_img}"/></td>
				  <td><a href="detail2?user_id=${bookmark.user_id}" >${bookmark.user_id}</a></td>
				  <td>${bookmark.mrk_date}</td>
			    </tr>
			    
				<div class="divTableCol">
					<div class="divTableRow">${num}</div>
				</div> 
				
				<%-- <a href="#" class="bMarkMem">
					회원프사 : <img class="memberImg" src="${member.user_img}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					회원아이디 : ${bookmark.userㅏ
				</a> --%>
				
				
				  
				
				
				<c:set var="num" value="${num - 1 }"></c:set>
			</c:forEach>
			</table>
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
</body>
</html>