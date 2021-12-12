<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/wk/tapstyle.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){ 
		if($("#tab01").is(":checked")){
	        alert("test");
		}
        
	});

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="tab_content">
	<input type="radio" name="tabmenu" id="tab01" checked="checked">
	<label for="tab01">지원결과 </label>
	<input type="radio"  name="tabmenu" id="tab02">
	<label for="tab02">나의 이력서 열람기업 </label>
	
	<div class="conbox con1">
		지원완료 : ${countapply[0].applying}<br>
		서류통과 : ${countapply[0].passdoc}<br>
		최종합격 : ${countapply[0].failed}<br>
		불합격 : ${countapply[0].pass}<p>
		
		<table>
			<tr>
				<th>알림</th><th>지원회사</th><th>공고 제목</th><th>지원포지션</th><th>이력서제목</th><th>작성시간</th><th>상태</th>
				<c:forEach var="applyList" items="${applyList }">
					<tr>
						<td><c:if test="${not empty applyList.user_ntc_code }">O</c:if></td>
						<td>${applyList.com_name}</td><td>${applyList.anno_title}</td>
						<td>${applyList.comm_ctx}</td><td>${applyList.res_title}</td>
						<td>${applyList.app_regdate}</td><td>${applyList.com_app_sts}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</div>
	<div class="conbox con2">
		이력서 열람기업
		<table>
			<tr>
				<th>알림</th><th>이력서</th><th>회사명</th><th>주소</th><th>업종</th><th>열람일</th>
				<c:forEach var="resConList" items="${resConList }">
					<tr>
						<td><c:if test="${not empty resConList.ntc_code }">O</c:if></td>
						<td>${resConList.res_title}</td><td>${resConList.com_name}</td>
						<td>${resConList.com_addr}</td><td>${resConList.comm_ctx}</td>
						<td>${resConList.res_date}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>