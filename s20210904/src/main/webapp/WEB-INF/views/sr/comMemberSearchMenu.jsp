<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comMemberSearch.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ComMypage</title>
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
					<div class="comInfoSearch">
						<form class="search_form" action="SrSearch">
							<input class="search_keyword" name="keyword" type="text"
								placeholder="검색어를 입력하세요" />
							<button class="search_bnt" type="submit">search</button>
						</form>
					</div>
					<div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>