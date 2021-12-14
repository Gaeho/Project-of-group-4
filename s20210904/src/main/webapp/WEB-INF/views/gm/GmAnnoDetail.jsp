<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<link href="css/gm/GmAnnoDetail.css" rel="stylesheet" type="text/css">
<title>코딩몬</title>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	/* EmpController */
	function setScrap(){
		alert("setScrap Start..");  
		var anno_code = $('#anno_code').val()
		var user_id = $('#user_id').val()
		var it_like = $('#it_like').val()
		alert("setScrap anno_code->"+ anno_code);  
		alert("setScrap user_id->"+user_id);  
		alert("setScrap it_like->"+it_like);  
	
	 	$.ajax({
			url:"<%=context%>/scrap",
			data:{anno_code : anno_code,
			      user_id   : user_id,
			      it_like   : it_like
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
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-------------------------------------------------------------------------------------->
	<div class="BigBigContainer12">
	<div class="BigContainer12">
	
		<div class="TopContainer">
			<div>				
				<div class="Top1s">
					
								<h2> -공고 상세- </h2>
								  <div class="com_title">
									<div><h1>${comanno.anno_title}</h1></div>
								  </div>
								  <div class="com_name">
									<div><h2>${comanno.com_name}</h2></div>
								  </div>
			    </div>				  
				<div class="Top2s">				  
								<div>
									<c:choose>
									   <c:when test="${itlike == 0}">
									      <input type="button" class="btn btn-outline-warning" id="likebtn" value="스크랩 ☆" onclick="setScrap()">
										  <input type="hidden" id="likecheck" value="${itlike}">
									   </c:when>
									    
								       <c:when test="${itlike == 1}"> 
									      <input type="button" class="btn btn-warning" id="likebtn" value="스크랩 ★" onclick="setScrap()">
									      <input type="hidden" id="likecheck" value="${itlike}">
									   </c:when>
									</c:choose>
									  
									<!-- <input type="button" class = "btn btn_danger" id="likebtn" value="스크랩 " onclick="setScrap()"> -->

								    <input type="hidden" name="anno_code" value="${comanno.anno_code}">
								
								 <%--    <input type="button" value="지원하기" onclick="location.href='GmApplyList?anno_code=${comanno.anno_code}'">  --%>
								    <input type="button" value="지원하기" class="btn btn-warning" onclick="location.href='GmApplyList?anno_code=${comanno.anno_code}'"> 
								   

								    	<div class="scrap_infos">
										     anno_code : <input type="text" id="anno_code"    value="1"          ><p>
											 user_id :   <input type="text" id="user_id"      value="dmdtla054"  ><p>
											 it_like :   <input type="text" id="it_like"      value="${itlike }" ><p>
										</div>
								</div>	 						
					</div>	
				</div>			 
		   </div>		
	
	
	<div class="MiddleContainer">
			<div class="GmContainer">
				<div class="TopInfoContainer">
					<div class="Topupper">
						<div>  
							<h3><모집 내용></h3>
							<table class="table">				
								<tr><th>모집직종</th><td>${recjob.comm_ctx}</td></tr>
								<tr><th>고용형태</th><td>${emptype.comm_ctx}</td></tr>
								<tr><th>모집인원</th><td>${comanno.rec_vol}</td></tr>
								<tr><th>기술스택1</th><td>${Techtag1.comm_ctx}</td></tr>
								<tr><th>기술스택2</th><td>${Techtag2.comm_ctx}</td></tr>
								<tr><th>학력</th><td>${comanno.rec_edu}</td></tr>
								<tr><th>경력</th><td>${career.comm_ctx}</td></tr>
							</table>
						</div>	
			
						<div>
							<h3><근무조건></h3>
							<table class="table">
								<tr><th>급여정보</th><td class="table align-middle">${comanno.pay_info}원</td></tr>
								<tr><th>근무조건</th><td class="table align-middle">${comanno.work_cdt}</td></tr>
								<tr><th>복리후생</th><td class="table align-middle">${comanno.etc_cdt}</td></tr>
							</table>
						</div>	
					</div>
					<div class="Toplower">
						<div style="color:silver">
							최저임금계산에 대한 알림 하단에 명시된 급여, 근무 내용 등이 최저임금에 미달하는 경우 위 내용이 우선합니다.
						</div>
					</div>
				</div>		
					
				<!----------------------------------------------------------------------------------->
				<div>	
					<h3><기업 정보></h3>
					<table class="table table align-middle">
						<tr><th>기업명</th><td>${comanno.com_name}</td></tr>
						<tr><th>E-mail</th><td>${comanno.com_email}</td></tr>
						<tr><th>연락처</th><td>${comanno.com_tel}</td></tr>
						<tr><th>담당자</th><td>${comanno.com_user}(${comanno.com_mgr_tel})</td></tr>
						<tr><th>기업 주소</th><td>${comanno.com_addr}</td></tr>
						<tr><th>업종</th><td>${comsec.comm_ctx}</td></tr> 
						<tr><th>사업<p>내용</th><td>${comanno.com_bus}</td></tr>
						<tr><th>홈페<p>이지</th><td>${comanno.com_web}</td></tr>
					</table>	

				</div>		
				<!----------------------------------------------------------------------------------->
				
				<div>
					<div><h3>[모집 상세]</h3></div>
					<div>${comanno.rec_dtl}</div>
				</div>
	
				<!----------------------------------------------------------------------------------->
				<div>	
					<table class="anno_date">
						<h3><공고 기간></h3>
						<tr><th>공고 등록일 : </th><td>${comanno.anno_regdate}</td></tr>
						<tr><th>공고 마감일 : </th><td>${comanno.anno_c_regdate}</td></tr>
					</table>	
				</div>
				<div class="anno_applys">
						<div class="d-grid gap-2">
							<button class="anno_apply_btn1" type="button" onclick="location.href='GmApplyList'">지원하기</button>
						</div>
				</div>
				
				<!-------------------------------------------------------------------------------------->

				<br><br><br>
			</div>
			<div class="MenuContainer">
				<div class="mapContainer">
					<div><h3>위치</h3></div>
					<input type="hidden" id="comAddr3" value="${comanno.com_addr}" >
					<input type="hidden" id="comName3" value="${comanno.com_name}" >
					<%@ include file="/WEB-INF/views/dj/djMaps.jsp"%>
					<div  style="color:silver">${comanno.com_addr}</div>
				</div>
			</div>
				
				
				
				
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>