<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypage.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypageApplySum.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypageTable.css" rel="stylesheet" type="text/css">
<link href="css/wk/tapstyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var notice_apply=0;
	var notice_resCon=0;
	var addTitleAppend="";
	// radio버튼을 눌러서 페이지로 이동해야 알림이 삭제되도록 삭제되는 알림 분류
	$(function(){ 
		if($('input:radio[id=tab01]').is(":checked")){
			notice_apply=1;
			addTitleAppend="<h1>입사지원현황</h1>";
			$("#mypageTitle").empty();
			$("#mypageTitle").append(addTitleAppend);
		}
		
		if($('input:radio[id=tab02]').is(":checked")){
			notice_resCon=1;
			addTitleAppend="<h1>나의 이력서 열람기업</h1>";
			$("#mypageTitle").empty();
			$("#mypageTitle").append(addTitleAppend);
		}
		
		$("input:radio[id=tab01]").click(function(){
			notice_apply=1;
			addTitleAppend="<h1>입사지원현황</h1>";
			$("#mypageTitle").empty();
			$("#mypageTitle").append(addTitleAppend);
		});
		
		$("input:radio[id=tab02]").click(function(){
			notice_resCon=1;
			addTitleAppend="<h1>나의 이력서 열람기업</h1>";
			$("#mypageTitle").empty();
			$("#mypageTitle").append(addTitleAppend);
		});
	});
	
	
	
	
	// 알림삭제 ajax
	function noticeDelete(){
		alert('noticeDelete start');
		
		$.ajax({
		   url: "mbMypageNoticeDelete",
		   type: "POST",
		   data: {"notice_apply":notice_apply,"notice_resCon":notice_resCon},
		   dataType:'text',
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
 	<div class="mypageTitle" id="mypageTitle">
	</div> 
	
	<div class="mbMypageMenu">
		<div class="menu_profile">
			<input type="image" class="profile_img" src="${profile}" 
				alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="profile_img" >
			<div class="mbFormText mb_center">${mbid } 님</div>
		</div>
		
		<p>
		
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon1.png" onclick="location.href='mbMypage'">
			<a class="mbMypageMenuBox" href="mbMypage">마이페이지홈</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon2.png" onclick="location.href='mbMypageApply'">
			<a class="mbMypageMenuBox" href="mbMypageApply">입사지원현황</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon3.png" onclick="location.href='mbMypageApply?notice_msg=2'">
			<a class="mbMypageMenuBox" href="mbMypageApply?notice_msg=2">나의 이력서 열람기업</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon4.png" onclick="location.href='mbMypageResume'">
			<a class="mbMypageMenuBox" href="mbMypageResume">이력서관리</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon5.png" onclick="location.href='mbMypageResumeWrite'">
			<a class="mbMypageMenuBox" href="mbMypageResumeWrite">이력서작성</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon6.png" onclick="location.href='mbMypageScrap'">
			<a class="mbMypageMenuBox" href="mbMypageScrap">스크랩</a>
		</div>
		<div class="menu_bar">
			<input type="image" class="Menu_img" src="./img/wk/icon7.png" onclick="location.href='mbMypageUpdate'">
			<a class="mbMypageMenuBox" href="mbMypageUpdate">마이페이지수정</a>
		</div>
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
				<div class="mbMypageApplySum">
					<h2 class="mbMypageApplySum_title">지원 현황</h2>
					<ul class="mbMypageApplySum_ul">
						<li>
							<a href="mbMypageApply">
								<em>${countapply[0].applying}</em>
								<span>지원중</span>
							</a>
						</li>
						<%-- <li>
							<a href="mbMypageApply">
								<em>${countapply[0].passdoc}</em>
								<span>서류 통과</span>
							</a>
						</li> --%>
						<li>
							<a href="mbMypageApply">
								<em>${countapply[0].failed}</em>
								<span>최종 합격</span>
							</a>
						</li>
						<li>
							<a href="mbMypageApply">
								<em>${countapply[0].pass}</em>
								<span>불합격</span>
							</a>
						</li>
					</ul>
				</div>
				
				<div class="mbMypageTable">
					<table class="table">
						<tr class="table-warning">
							<th> </th><th>지원회사</th><th>공고 제목</th><th>지원포지션</th><th>이력서제목</th><th>작성시간</th><th>상태</th>
						</tr>
						<c:forEach var="applyList" items="${applyList }">
							<tr>
								<td>
									<c:if test="${not empty applyList.user_ntc_code }">
										<input type="image" class="notice_img" src="./img/ds/on.png">
									</c:if>
								</td>
								<td>${applyList.com_name}</td><td><a href="detail?anno_code=${applyList.anno_code }">${applyList.anno_title}</a></td>
								<td>${applyList.comm_ctx}</td><td>${applyList.res_title}</td>
								<td>${applyList.app_regdate}</td><td>${applyList.com_app_sts}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="conbox con2">
				<p>
				<div class="mbMypageTable">
					<table class="table">
						<tr class="table-warning">
							<th> </th><th>이력서</th><th>회사명</th><th>주소</th><th>업종</th><th>열람일</th>
							<c:forEach var="resConList" items="${resConList }">
								<tr>
									<td>
										<c:if test="${not empty resConList.ntc_code }">
											<input type="image" class="notice_img" src="./img/ds/on.png">
										</c:if>
									</td>
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
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>