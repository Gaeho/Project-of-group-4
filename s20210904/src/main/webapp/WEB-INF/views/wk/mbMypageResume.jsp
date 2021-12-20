<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>        
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<link href="css/wk/mbMypageMenu.css" rel="stylesheet" type="text/css">
<link href="css/wk/mbMypage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function resume_delete(res_code){
		if(confirm("이력서를 삭제하시겠습니까 ?") == true){
			$.ajax({
				url:"<%=context%>/mbMypageResumeDelete",
				data:{res_code : res_code},
				dataType:'text',
				success:function(data){
					if(data>0){
						alert("삭제되었습니다");
						location.replace("mbMypageResume");
					}else{
						alert("삭제 실패"+data);
					}
				},
				error:function(){
					alert("삭제에 실패하였습니다"+data);
				}
			});
		}else{
			return ;
		}
	}
	
	// 대표이력서 해제
	function rep_resume_del(res_code){
		$.ajax({
			url:"/mbMypageRepResumeDelete",
			type: "POST",
			data:{res_code : res_code},
			dataType:'text',
			success:function(data){
				if(data>0){
					/* alert("대표이력서 해제되었습니다"); */	
					location.replace("mbMypageResume");
				}else{
					/* alert("해제 실패"+data); */
				}
			},
			error:function(){
				/* alert("대표이력서 해제에 실패하였습니다"+data); */
			}
		});
	}
	
	// 대표이력서 설정
	function rep_resume(res_code){
		var rep_res_code=0;
		rep_res_code=document.getElementById('rep_res').value;
		/* alert("rep_res_code : "+rep_res_code); */
		
		if(rep_res_code != "0"){
			/* alert("test1"); */
			rep_resume_del(rep_res_code);
		}
		$.ajax({
			url:"/mbMypageRepResume",
			type: "POST",
			data:{"res_code" : res_code},	/* , "rep_res_code" : rep_res_code */
			dataType:'text',
			success:function(data){
				if(data>0){
					/* alert("대표이력서로 설정되었습니다"); */
					location.replace("mbMypageResume");
				}else{
					/* alert("설정 실패"+data); */
				}
			},
			error:function(){
				/* alert("대표이력서 설정에 실패하였습니다"+data); */
			}
		});
	}


</script>

 </head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="mypageContent-wrap">
	<div class="mypageTitle">
		<h1>이력서 관리</h1><p><p>
	</div>
	
	<div class="mbMypageMenu">
		<div class="menu_profile">
			<input type="image" class="profile_img" src="${profile}" 
				alt="이미지 없음" onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" >
			<div class="mbFormText">${mbid } 님</div>
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
		<c:if test="${empty resumelist}">
			<h3 class="mbMypageTable_title">작성한 이력서가 없습니다</h3>
		</c:if>
		<c:if test="${not empty resumelist}">
			<%-- <c:if test="${not empty msg}">${msg }<br> </c:if> --%>
			<h4 class="mbMypageTable_title">나의 이력서</h4>
			
			<div class="mbMypageTable">
				<table class="table">
					<tr class="table-warning">
						<th>번호</th><th>이력서 제목</th><th>작성 날짜</th><th>희망 직종</th><th></th><th></th><th></th><th></th>
					</tr>
					<c:forEach var="resumelist" items="${resumelist}" varStatus="status">
						<tr>
							<td>${status.count}</td><td>${resumelist.res_title}</td><td>${resumelist.res_date}</td>
							<td>
								<c:if test="${empty resumelist.comm_ctx}">없음</c:if>
								<c:if test="${not empty resumelist.comm_ctx}">${resumelist.comm_ctx}</c:if>
							</td>
							<td><c:if test="${resumelist.rep_res eq 1}">대표이력서</c:if></td>
							<td>
								<c:if test="${resumelist.rep_res eq 1}">
									<input type="button" value="대표이력서 해제" onclick="rep_resume_del(${resumelist.res_code})">
									<input type="hidden" id="rep_res" value="${resumelist.res_code}">
								</c:if>
								<c:if test="${resumelist.rep_res eq 0}">
									<input type="button" value="대표이력서로 설정" onclick="rep_resume(${resumelist.res_code})">
								</c:if>
							</td>
							<td>
								<input type="submit" onclick="location.href='mbMypageResumeUpdate?res_code=${resumelist.res_code}'" value="수정">
							</td>
							<td>	
								<input type="button" onclick="resume_delete(${resumelist.res_code})" value="삭제">
							</td>
						</tr>
					</c:forEach>
				</table><br>
				<input type="hidden" id="rep_res" value="0">
			</div>
		</c:if>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>