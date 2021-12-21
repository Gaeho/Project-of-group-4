<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<link href="css/sr/comMypageUpdate.css" rel="stylesheet" type="text/css">
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
				</div>m
			</div>
			<form action="comMypageUpdate2" method="post">
			<div class="comInfoUnder">
				<div class="comInfoleft">
					<%@ include file="myPageMenu.jsp"%>
				</div>
				<div class="comInforight">
				<div class="info">
					<div class="divTableRow-top">
						<div>
							<div id="com_info-img">
								<div>
									<div class="middleTitle_anno_text">
										<!-- <label for="compimg3">사내 이미지</label> -->
										<div class="input-group mb-3" style="flex-direction:column;">
											<form id="fileForm" name="frm" method="post">
												<input class="imagesquare1" name="com_img11" 
														type="image"src="${commCompany1.com_img1}" alt="이미지 없음" 
														onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" 
														value="${commCompany1.com_img1}"><p>
												<input type="file" class="form-control" id="file1" name="file1" /> 
												<input type="hidden" id="comId1" name="comId1" value="${commCompany1.com_id}">
												<p style="display:flex; justify-content: center;">
												<input type="button" value="업로드" onclick="uploadFile()"> 
												<input type="button" value="삭제" id="delImg12" onclick="deleteFile()">
											</form>
										</div>
									</div>
									<%-- <img class="comLogo" src="${commCompany1.com_img}" /> --%>
								</div>
							</div>
							<div id="com_info-bus">
								<div class="info-text-bus">사업내용</div>
								<div class="info-value-bus">
									<textarea name="com_bus">${commCompany1.com_bus}</textarea>
								</div>
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
									<div class="info-value">
										<input type="text" name="com_id" value="${commCompany1.com_id}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">회사명</div>
									<div class="info-value">
										<input type="text" name="com_name" value="${commCompany1.com_name}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">전화번호</div>
									<div class="info-value">
										<input type="text" name="com_tel" value="${commCompany1.com_tel}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">주소</div>
									<div class="info-value">
										<input type="text" name="com_addr" value="${commCompany1.com_addr}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">이메일</div>
									<div class="info-value">
										<input type="text" name="com_email" value="${commCompany1.com_email}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">업종</div>
									<%-- <div class="info-value">
										<input type="text" value="${commCompany1.comm_ctx}">
									</div> --%>
									<select name="com_sec" class="com_sec">
											<c:forEach var="commList" items="${commList}">
												<option value="${commList.sub_cat}" selected="selected">${commList.comm_ctx}</option>
											</c:forEach>
									</select>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">담당자 전화번호</div>
									<div class="info-value">
										<input type="text" name="com_mgr_tel" value="${commCompany1.com_mgr_tel}">
									</div>
								</div>
							</div>
							<div class="divTableRow">
								<div id="com_info">
									<div class="info-text">사이트</div>
									<div class="info-value">
										<input type="text" name="com_web" value="${commCompany1.com_web}">
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<%-- <div class="divTableRow_bottom">
						<div>
							<div id="com_info_imges">사내이미지</div>
							<div>	
								<img class="imges" src="${commCompany1.com_img1}" /> 
								<img class="imges" src="${commCompany1.com_img2}" /> 
								<img class="imges" src="${commCompany1.com_img3}" />
								<br>

							</div>
						</div>
					</div> --%>
						<%-- <div class="middleTitle_anno_text">
							<!-- <label for="compimg3">사내 이미지</label> -->
							<div class="input-group mb-3">
								<form id="fileForm" name="frm" method="post">
									<input class="imagesquare2" name="com_img11" type="image"
										src="${commCompany1.com_img1}" alt="이미지 없음"
										onerror="this.src='./img/dj/no_Image.gif'" id="imagesquare1" value="${commCompany1.com_img1}">
									<p>
										<input type="file" class="form-control" id="file1" name="file1" />
										<input type="hidden" id="comId1" name="comId1" value="${commCompany1.com_id}">
									<p>
										<input type="button" value="업로드" onclick="uploadFile()">
										<input type="button" value="삭제" id="delImg12" onclick="deleteFile()">
								</form>
							</div>
						</div> --%>
					<div class="comInfoCheck">
						<div class="comInfocheck-in">
							<div class="btnUpdate"><input class="ComBtnleft btn btn-primary" type="submit" value="확인" id="submit_btn" style="margin-right: 5px;'"> </div>
							<div class="btnUpdate"><input class="ComBtn btn btn-primary" type="button" value="취소" onclick="location.href='ComInfo'"></div>
						</div>
					</div>
					</div>
					</div>
					
				</form>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>