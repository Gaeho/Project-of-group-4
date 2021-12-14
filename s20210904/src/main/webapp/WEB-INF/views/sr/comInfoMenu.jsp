<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.testcss {
	width: 150px;
	height: 150px;
	border: 1px solid black;
}

.menuBox {
	text-decoration: none;
	text-align: center;
	color: white;
	padding: 8px 16px;
	background-color: black;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}

.menuBox:hover {
	color: black;
	background-color: white;
}

.divTableRow {
	text-decoration: none;
	text-align: center;
	color: black;
	padding: 8px 16px;
	background-color: pink;
	border: 1px solid white;
	transition: background-color 0.3s, color 0.3s;
}
</style>
</head>
<body>


	<div class="CompanyMypageContainer">
		<a href="#" id="ComMylogo"> <img class="testcss" src="${commCompany1.com_img}" /></a>
		<div class="CompanyMypageMenu" style="display: flex; flex-direction: column; width: fit-content;">
			<a class="menuBox" href="ComInfo"> <span>기업정보</span></a> <br>
			<a class="menuBox" href="ComAppStatus"><span>지원현황</span></a><br>
			<a class="menuBox" href="GmAnnoList"><span>채용공고</span></a><br>
			<a class="menuBox" href="bookmarkList"><span>북마크회원</span></a><br>
			<a class="menuBox" href="ComMemSearch"><span>검색</span></a>
		</div>
		<div class='comIfoMenu'>
			<div class="divTableRow">
				아이디 : 
				<div id="com_id">${commCompany1.com_id}</div>
			</div>
			<div class="divTableRow">
				회사명 : 
				<div id="com_name">${commCompany1.com_name}</div>
			</div>
			<div class="divTableRow">
				전화번호 : 
				<div id="com_tel">${commCompany1.com_tel}</div>
			</div>
			<div class="divTableRow">
				주소 : 
				<div id="com_addr">${commCompany1.com_addr}</div>
			</div>
			<div class="divTableRow">
				이메일 : 
				<div id="com_email">${commCompany1.com_email}</div>
			</div>
			<div class="divTableRow">
				업종 : 
				<div id="com_sec">${commCompany1.comm_ctx}</div>
			</div>
			<div class="divTableRow">
				사업내용 : 
				<div id="com_bus">${commCompany1.com_bus}</div>
			</div>
			<div class="divTableRow">
				담당자 전화번호 : 
				<div id="com_mgr_tel">${commCompany1.com_mgr_tel}</div>
			</div>
			<div class="divTableRow">
				사이트 : 
				<div id="com_web">${commCompany1.com_web}</div>
			</div>
			<div class="divTableRow">
				사내 이미지 : 
				<div id="com_img">${commCompany1.com_img}</div>
			</div>
		</div>
	</div>
	
	
	<div><%-- ?com_id=${commCompany1.com_id --%>} <!-- onclick="location.href='ComInfoUpdate'" -->
		<input class="comInfoUpdate" type="button" value="수정"  onclick="location.href='ComInfoUpdate?com_pw=${commCompany1.com_pw}'"">
		
			
	</div>
</body>
</html>