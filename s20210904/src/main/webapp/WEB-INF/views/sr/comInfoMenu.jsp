<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<link href="css/sr/Srmypage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function uploadFile() {
		alert('uploadFile Start...');
		var form = new FormData();
		var comId1 = document.getElementById('comId1').value;
		alert('comId1>>' + comId1);

		form.append("file1", $("#file1")[0].files[0]);
		form.append("comId1", $("#comId1")[0].value);

		$.ajax({
			url : "/DjComImguploadForm",
			type : "POST",
			data : form,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			datatype : 'text',
			success : function(data) {
				alert("성공");
				/*  $('input[name=com_img11]').attr('src',data); */
				alert("도대체 뭔가 들어있긴 하니?->" + data)
				document.getElementById('imagesquare1').src = data;
				document.getElementById('imagesquare1').value = data;

			},
			error : function() {
				alert("실패");
				// Handle upload error
				// ...
			}
		});
	}

	function deleteFile() {
		alert('deleteFile Start...');
		var form1 = new FormData();
		alert('삭제할 내용' + document.getElementById('imagesquare1').value);

		//form1.append( "comImg123", $("#imagesquare1")[0].value);

		var comImg123 = {
			"comImg123" : document.getElementById('imagesquare1').value
					.toString()
		}

		/*    comImg123.value = null; */

		/* 	 this.clearImage()  */

		/* 	form1.append( "imgpath11", document.getElementById('imagesquare1').value);
		 */
		$
				.ajax({
					url : "DjComImguploadForm",
					data : comImg123,
					dataType : 'text',
					success : function(data) {
						alert("삭제성공!!" + data);
						document.getElementById('imagesquare1').src = 'src=/img/dj/no_Image.gif';

					},
					error : function() {
						alert("삭제실패ㅜㅜ");
						// Handle upload error
						// ...
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
					<h1>마이페이지 작업 중</h1>
				</div>
			</div>
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
					<div class="divTableRow-top">
						<div>
							<div id="com_info-img">
								<div>
									<img class="comLogo" src="${commCompany1.com_img}" />
								</div>
							</div>
							<div id="com_info-bus">
								<div class="info-text-bus">사업내용</div>
								<div class="info-value-bus">${commCompany1.com_bus}</div>
							</div>
						</div>
					</div>
						<div class="hrTag">
							<hr>
						</div>
						
					<div class="divTableRow-mid">
						<div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">아이디</div>
									<div class="info-value">${commCompany1.com_id}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">회사명</div>
									<div class="info-value">${commCompany1.com_name}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">전화번호</div>
									<div class="info-value">${commCompany1.com_tel}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">주소</div>
									<div class="info-value">${commCompany1.com_addr}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">이메일</div>
									<div class="info-value">${commCompany1.com_email}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">업종</div>
									<div class="info-value">${commCompany1.comm_ctx}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">담당자 전화번호</div>
									<div class="info-value">${commCompany1.com_mgr_tel}</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">사이트</div>
									<div class="info-value">${commCompany1.com_web}</div>
								</div>
							</div>
						</div>
					</div>
					<div class="divTableRow_bottom">
						<div>
							<div id="com_info_imges">사내이미지</div>
							<div>	
								<img class="imges" src="${commCompany1.com_img1}" /> 
								<img class="imges" src="${commCompany1.com_img2}" /> 
								<img class="imges" src="${commCompany1.com_img3}" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<a class="mbMypageMenuBox" href="ComMypageUpdate">마이페이지수정</a> -->
	<%-- <div>
					<div class="middleTitle_anno_text">
						<label for="compimg3">회사 이미지</label>
						<div class="input-group mb-3">
							<form id="fileForm" name="frm" method="post">
								<input class="imagesquare1" name="com_img11" type="image" src="${compInfo.com_img}" alt="이미지 없음"
									onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1"
									value="${compInfo.com_img}">
								<p>
									<input type="file" class="form-control" id="file1" name="file1" />
									<input type="hidden" id="comId1" name="comId1" value="${compInfo.com_id}">
								<p>
									<input type="button" value="업로드" onclick="uploadFile()"> 
									<input type="button" value="삭제" id="delImg12" onclick="deleteFile()">
							</form>
						</div>
					</div>
				</div> --%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>