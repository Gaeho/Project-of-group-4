<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 로그인 </title>
<link rel="stylesheet" href="css/sh/login.css" type="text/css">
<script type="text/javascript">

function logincheck() {
	if (!frm.user_id.value) {
		alert("id를 입력해 주십시오.");
		frm.user_id.focus();
		return false;
	}
	if (!frm.user_pw.value) {
		alert("비밀번호를 입력해 주십시오.");
		frm.user_pw.focus();
		return false;
	}
	return true;
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>					
					
					<div id="Shcontainer">
							<div class="main">
		
									<form action="loginForm"  method="post" class="main__form" name="frm" onsubmit=" return logincheck()">
											<h1>개인로그인</h1>

						
										<div class="main__form__find">
											<label for="sign_id">아이디</label>
											<input type="text" id="id"  name="user_id"  placeholder="Enter id">
										</div>
						
										<div class="main__form__find">
											<label for="sign_pw">비밀번호</label>
											<input type="password"  id="password" name="user_pw"  placeholder="Enter password">
										</div>
						
										<div class="main__form__link">
											<a href="Comlogin">기업이라면 여기를 눌러주세요!</a>
						
											<a href="join"> <p>코딩몬이 처음이신가요?그럼 우리와 함께 할 수 있는 계정을 만들어 보아요 :)</p></a>
										</div>
						
										<div class="form__find__button">
											<button type="submit" class="form__find__btn" >LOGIN</button>
										</div>
						
										<div class="form__find__border">
											<p>or</p>
										</div>
						
										<div class="form__find__bottom">
											<a href="findId">아이디를 잊으셨나요?</a>
											<a href="findPw">비밀번호를 잊으셨나요?</a>
										</div>
									</form>
							</div>
					</div>
				
		<%@ include file="/WEB-INF/views/footer.jsp"%>					
</body>
</html>
	
	
	
	
	
	<!--  <div class="Container">	   
	
				<div class="tab_content">
				

						<input type="radio" name="tabmenu" id="tab01" checked="checked">
						<label for="tab01">개인</label>
						<input type="radio"  name="tabmenu" id="tab02">
						<label for="tab02">기업 </label>

			
								<div class="conbox con1">
										 아이디 :     <input type="text" id="id" name="user_id" placeholder="아이디를 입력하세요"><p>
								     	 비밀번호 : <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" ><p>
									                      <input type="submit" value="로그인">
			
								<div class="btn">			
												<input type="button" class="btn1" value="아이디 찾기" onclick="location.href='findId'">
												<input type="button" class="btn2" value="비밀번호 찾기" onclick="location.href='findPw'">
												<input type="button" class="btn3" value="회원가입" onclick="location.href='join'">
								</div>			
				     </div> 
					
			   
			                                                                                          <div class="conbox con2">
			    		 				 아이디 :    <input type="text" id="id" name="com_id" placeholder="아이디를 입력하세요"><P>
										 비밀번호 : <input type="password" name="com_pw" placeholder="비밀번호를 입력하세요" ><p>
										                  <input type="submit" value="로그인">
										
								  <div class="btn">			
												<input type="button" class="btn1" value="기업아이디 찾기" onclick="location.href='findComId'">
												<input type="button" class="btn2" value="기업비밀번호 찾기" onclick="location.href='findComPw'">
												<input type="button" class="btn3" value="기업회원가입" onclick="location.href='Comjoin'">
								</div>	
				    </div>
				</div>	
	</div>-->
