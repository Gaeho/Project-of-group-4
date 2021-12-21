<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comAppStatus.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ComMypage</title>
<link href="css/sr/comMypage.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
			<div class="comInfomid">
				<div class="compAppStatus_btn">
						<select
							onchange="location.href='ComAppStatus?anno_code='+this.value">
							<c:forEach var="annolist" items="${annoList}">
								<option value="${annolist.anno_code}">${annolist.anno_title }</option>
							</c:forEach>
						</select>
					</div>
			</div>
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
					<div class="compAppStatus_in">
						<table class="table table-hover">
							<thead class="table-light">
							<tr>
								<th>회원프사</th>
								<th>회원 아이디</th>
								<th>지원날짜</th>
								<th>합격여부</th>
							</tr>
							</thead>
							<c:forEach var="appAnnMember" items="${appAnnMember }">
								<tr>
									<td><img class="MemImg" src="${appAnnMember.user_img}" /></td>
									<td><a
										href="detail2?user_id=${appAnnMember.user_id }&com_id=${appAnnMember.com_id}&mrk_res_code=${appAnnMember.mrk_res_code}&isResume=1&anno_code=${appAnnMember.anno_code}">${appAnnMember.user_id}</a></td>
									<td>${appAnnMember.app_regdate }</td>
									<c:choose>
										<c:when test="${appAnnMember.app_sts == '001'}">
											<td><input type="button" value="합격"
												onclick="location.href='memPass?user_id=${appAnnMember.user_id}&res_code=${appAnnMember.mrk_res_code }&anno_code=${appAnnMember.anno_code}'">
												<input type="button" value="불합격"
												onclick="location.href='memFail?user_id=${appAnnMember.user_id}&res_code=${appAnnMember.mrk_res_code }&anno_code=${appAnnMember.anno_code}'">
											</td>
										</c:when>
										<c:when test="${appAnnMember.app_sts == '002'}">
											<td>서류합격</td>
										</c:when>
										<c:when test="${appAnnMember.app_sts == '003'}">
											<td>합격입니다</td>
										</c:when>
										<c:when test="${appAnnMember.app_sts == '004'}">
											<td>불합격입니다</td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>