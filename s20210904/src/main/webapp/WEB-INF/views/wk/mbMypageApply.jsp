<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<link href="css/wk/tapstyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){ 
		/* var listVar = $('input[name=tabmenu]').is(":checked"); */
		/* alert('test : '); */
        
	});
	
	function noticeDelete(){
		alert('noticeDelete start');
		
		$.ajax({
		   url: "mbMypageNoticeDelete",
		   type: "POST",
		   /* data: {"img_path":img_path,"uploadsts":uploadsts}, */
		   /* dataType:'text', */
		   success: function () {
			   /* alert("삭제성공!!"); */
			},
		    error: function () {
		    	/* alert("삭제실패ㅜㅜ"); */
		      // Handle upload error
		    }
		});
	}
	
	
	// 창을 벗어날때 알림삭제
    $(window).on("beforeunload", function(){
    	alert('beforeunload');
    	noticeDelete();
    });

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="mypageContent-wrap">
	<div class="mbMypageMenu">
		<input type="image" class="profile_img" src="${profile}" 
			alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" ><br>
			${mbid } 님<p>
		<ul>
			<li><a class="mbMypageMenuBox" href="mbMypage">마이페이지홈</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a></li>
			<li><a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a></li>
		</ul>
	</div>
	<div class="mbMypageMain">
		<div class="tab_content">
			<c:if test="${notice_msg eq 1 or empty notice_msg}">
				<input type="radio" name="tabmenu" id="tab01" checked="checked" value="test1">
				<label for="tab01">지원결과 </label>
				<input type="radio"  name="tabmenu" id="tab02" value="test2">
				<label for="tab02">나의 이력서 열람기업 </label>
			</c:if>
			
			<c:if test="${notice_msg eq 2}">
				<input type="radio" name="tabmenu" id="tab01" value="test1">
				<label for="tab01">지원결과 </label>
				<input type="radio"  name="tabmenu" id="tab02" checked="checked" value="test2">
				<label for="tab02">나의 이력서 열람기업 </label>
			</c:if>
			
			
			<div class="conbox con1">
				지원완료 : ${countapply[0].applying}<br>
				서류통과 : ${countapply[0].passdoc}<br>
				최종합격 : ${countapply[0].failed}<br>
				불합격 : ${countapply[0].pass}<p>
				
				<table>
					<tr>
						<th>알림</th><th>지원회사</th><th>공고 제목</th><th>지원포지션</th><th>이력서제목</th><th>작성시간</th><th>상태</th>
					</tr>
					<c:forEach var="applyList" items="${applyList }">
						<tr>
							<td><c:if test="${not empty applyList.user_ntc_code }">O</c:if></td>
							<td>${applyList.com_name}</td><td><a href="detail?anno_code=${applyList.anno_code }">${applyList.anno_title}</a></td>
							<td>${applyList.comm_ctx}</td><td>${applyList.res_title}</td>
							<td>${applyList.app_regdate}</td><td>${applyList.com_app_sts}</td>
						</tr>
					</c:forEach>
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
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>