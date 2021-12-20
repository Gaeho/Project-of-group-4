<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comMarkMemberMenu.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="CompanyMypageContainer">
		<div class="comAnnMenu">
			<div class="comInfoUpper">
				<div>
					<h1>마이페이지 작업 중</h1>
				</div>
			</div>
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
					<div class="annolist1">
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th scope="col">회원 사진</th>
									<th scope="col">회원 아이디</th>
									<th scope="col" colspan="2">이력서제목</th>
									<th scope="col">북마크등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bookmarkList" items="${bookmarkList }">
								<div clas="bmarkAtt">
									<tr>
										<td><img class="memberImg" src="${bookmarkList.user_img}" /></td>
										<div><td>${bookmarkList.user_id}</td></div>
										<td colspan="2"><a href="detail2?user_id=${bookmarkList.user_id }&com_id=${bookmarkList.com_id}&mrk_res_code=${bookmarkList.mrk_res_code}">${bookmarkList.res_title}</a></td>
										<td>${bookmarkList.mrk_date}</td>
									</tr>
									</div>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>