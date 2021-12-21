<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/SrComAnn.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ComMypage</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="CompanyMypageContainer">
		<div class="comAnnMenu">
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
					<div class="annolist1">
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th scope="col" colspan="2">제목</th>
									<th scope="col">지원자격</th>
									<th scope="col">등록일</th>
									<th scope="col">마감일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listAnn" items="${listAnn}">
									<tr>
										<td colspan="2"><a
											href="detail?anno_code=${listAnn.anno_code}&com_id=${listAnn.com_id}">${listAnn.anno_title}</a></td>
										<td>${listAnn.rec_edu}</td>
										<td>${listAnn.anno_regdate}~</td>
										<td>${listAnn.anno_c_regdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="annoBottom">
				<div>
					<input class="annoWrite" type="button" value="공고 작성하기"
						onclick="location.href='DjAnnoWriteForm'">
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>