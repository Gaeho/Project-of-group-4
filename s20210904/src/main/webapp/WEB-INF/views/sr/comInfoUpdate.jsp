<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="comInfoUpdat">
			<form action="comInfo"  class="update-form">
				<div class="update-form-in">
					<div id="updateText">
						<h2>비밀번호를 입력해 주세요</h2>
					</div>
					<p>
					<div id="inputPwforUpdate">
							Password : <input type="text" name="com_pw">
					</div>
					<p>
					<div id="deletetext2">
						<button class="pwCheckBtn" type="submit" value="확인">확인</button>
						<button class="pwCheckBtn" value="취소" onclick="location.href=''">취소</button>
					</div>
				</div>
			</form>
		</div>
</body>
</html>