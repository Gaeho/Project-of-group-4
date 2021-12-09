<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<link href="css/sr/comMarkMemDetail.css" rel="stylesheet" type="text/css">
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
 <div class="ComBookmarkDetail">
 <%@ include file="/WEB-INF/views/header.jsp"%>
   <div class="user">
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
		
	
	 
	     <div class="bookmark">
	      <tr>
	       <td>
	        <c:choose>
			    <c:when test="${itbookmark == 0}">
			      <input type="button" class = "btn btn_light" id="likebtn" value="북마크  ☆ " onclick="setBookmark()">
				  <input type="hidden" id="likecheck" value="${itbookmark}">
			    </c:when>
			    
		        <c:when test="${itbookmark == 1}"> 
			      <input type="button" class = "btn btn_danger" id="likebtn" value="북마크 ★" onclick="setBookmark()">
			      <input type="hidden" id="likecheck" value="${itbookmark}">
			    </c:when>
			  </c:choose>
			  
			   com_id      : <input type="text"  id="com_id"      value="tlstprp5184" ><p>
			   user_id 	   : <input type="text"  id="user_id"     value="dmdtla054"  ><p>
			   it_bookmark : <input type="text"  id="it_bookmark" value="${itbookmark }" ><p>
			  
	       </td>
	      </tr>
	    </div>
	   
	      <table class="user_info">
	      	<h2>기본 정보</h2>
	      	<tr><th>프로필</th><td><img src="${mem.user_img}">
	      	<%-- <img class="memberImg" src="${mem.user_img}"/> --%></td></tr>
	      	<tr><th>이름</th><td>${mem.user_name}</td></tr>
	      	<tr><th>이메일</th><td>${mem.user_email}</td></tr>
	      	<tr><th>전화번호</th><td>${mem.user_tel}</td></tr>
	      	<tr><th>주소</th><td>${mem.user_addr}</td></tr>
	      </table>
	      
	      <table class="user_info2">
	      	<tr><th>원하는 직종</th><td>${jobtag.comm_ctx}</td></tr>
	      </table>
	      
	      <table class="resume">
	     	<h2>이력서</h2>
	     	<tr><th>제목</th><td>${mem.res_title}</td></tr>
	     	<tr><th>이름</th><td>${mem.user_name}</td></tr>
	      	<tr><th>이메일</th><td>${mem.res_email}</td></tr>
	      	<tr><th>고등학교</th><td>${mem.hs_name}</td></tr>
	      	<tr><th>고등학교 계열</th><td>${hsmjr.comm_ctx}</td></tr>
	      	<tr><th>대학교</th><td>${mem.univ_name}</td></tr>
	      	<tr><th>대학교 재학 기간</th><td>${mem.univ_date}</td></tr>
	      	<tr><th>대학교 전공</th><td>${mem.hs_name}</td></tr>
	      	<tr><th>자기소개서</th><td>${mem.cov_let}</td></tr>
	      	<tr><th>이력서 tag1</th><td>${restag1.comm_ctx}</td></tr>
	      	<tr><th>이력서 tag2</th><td>${restag2.comm_ctx}</td></tr>
	      	<tr><th>이력서 tag3</th><td>${restag3.comm_ctx}</td></tr>
	     </table>
	
		 
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


	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>