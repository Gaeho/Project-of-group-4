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
		var mrk_res_code = $('#mrk_res_code').val()
		alert("setBookmark com_id->"+ com_id);  
		alert("setBookmark user_id->"+user_id);  
		alert("setBookmark it_bookmark->"+it_bookmark);
		alert("setBookmark mrk_res_code->"+mrk_res_code); 
		
		
	 	$.ajax({
			url:"<%=context%>/bookmark",
			data : {
				com_id : com_id,
				user_id : user_id,
				it_bookmark : it_bookmark,
				mrk_res_code : mrk_res_code
			}, /*  */
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json", /* 서버에서 내려온 data 형식 */
			success : function(data) { /* 요청이 성공됬을때 실행되는 callback 함수 */
				alert("success data" + data);
				alert("setBookmark com_id->" + data.com_id);
				alert("setBookmark user_id->" + data.user_id);
				alert("setBookmark it_bookmark->" + data.it_bookmark);
				alert("setBookmark mrk_res_code->" + data.mrk_res_code);
				$("#com_id").text(data.com_id);
				$("#user_id").text(data.user_id);
				$("#it_bookmark").val(data.it_bookmark);
				$("#mrk_res_code").text(data.mrk_res_code);
				alert("성공");
				/* 	$('#it_bookmark').val(data); */

				location.reload(); // 페이지 리로드
			},
			error : function() {
				alert("에러 발생");
			}

		});

	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="CompanyMypageContainer">
		<div class="comInfoMenu">
			<div class="comInfoUpper">
				<div>
					<h1>마이페이지</h1>
				</div>
			</div>
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
					<div class="bookmark">
						<tr>
							<td><c:choose>
									<c:when test="${itbookmark eq 0}">
										<input type="button" class="btn btn_light" id="likebtn"
											value="북마크  ☆ " onclick="setBookmark()">
									</c:when>

									<c:when test="${itbookmark eq 1}">
										<input type="button" class="btn btn_danger" id="likebtn"
											value="북마크 ★" onclick="setBookmark()">
									</c:when>
								</c:choose> 
								<div class="bookmark_info">
									com_id : <input type="text" id="com_id" value="${com_id }"><p>
									user_id : <input type="text" id="user_id" value="${user_id }"><p>
									it_bookmark : <input type="text" id="it_bookmark" value="${itbookmark }"><p>
									mrk_res_code : <input type="text" id="mrk_res_code" value="${mrk_res_code }"><p>
								</div>
							</td>
						</tr>
					</div>
					<div>
						<table class="user_info1">
							<div class="h2div"><h2>기본 정보</h2></div>
							<tr>
								<th>프로필</th>
								<td><img id="memberDetailImg" src="${mem.user_img}"> <%-- <img class="memberImg" src="${mem.user_img}"/> --%></td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${mem.user_name}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${mem.user_email}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${mem.user_tel}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${mem.user_addr}</td>
							</tr>
						</table>
						<table class="user_info2">
							<tr>
								<th>원하는 직종</th>
								<td>${mem.jobTag}</td>
							</tr>
						</table>
					</div>
					<table class="resume">
						<div class="resumeText"><h2>이력서</h2></div>
						<tr>
							<th>제목</th>
							<td>${mem.res_title}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${mem.user_name}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${mem.res_email}</td>
						</tr>
						<tr>
							<th>고등학교</th>
							<td>${mem.hs_name}</td>
						</tr>
						<tr>
							<th>고등학교 계열</th>
							<td>${mem.hsMjr}</td>
						</tr>
						<tr>
							<th>대학교</th>
							<td>${mem.univ_name}</td>
						</tr>
						<tr>
							<th>대학교 재학 기간</th>
							<td>${mem.univ_date}</td>
						</tr>
						<tr>
							<th>대학교 전공</th>
							<td>${mem.univ_mjr}</td>
						</tr>
						<tr>
							<th>자기소개서</th>
							<td>${mem.cov_let}</td>
						</tr>
						<tr>
							<th>이력서 tag1</th>
							<td>${mem.tag1}</td>
						</tr>
						<tr>
							<th>이력서 tag2</th>
							<td>${mem.tag2}</td>
						</tr>
						<tr>
							<th>이력서 tag3</th>
							<td>${mem.tag3}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>