<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/sr/comMypageMenu.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="comMyMenuContainer">
		<div class="comMyMenuContainer-in">
			<div class="menuUp">
				<img class="comlogoMenu" src="${commCompany1.com_img}" />
			</div>
			<div class="menuDown">
				<div class="CompanyMypageMenu"><!-- style="display: flex; flex-direction: column; width: fit-content;" -->
					<div class="menuBox"><a href="ComInfo"><i class="bi bi-info-circle"></i><span>기업정보</span></a> <br></div>
					<div class="menuBox"><a href="ComAppStatus"><i class="bi bi-person-check"></i><span>지원현황</span></a><br></div>
					<div class="menuBox"><a href="ComAnn"><i class="bi bi-briefcase-fill"></i><span>채용공고</span></a><br></div>
					<div class="menuBox"><a href="bookmarkList"><i class="bi bi-bookmark-star"></i><span>북마크회원</span></a><br></div>
					<div class="menuBox"><a href="ComMemSearch"><i class="bi bi-search"></i><span>검색</span></a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>