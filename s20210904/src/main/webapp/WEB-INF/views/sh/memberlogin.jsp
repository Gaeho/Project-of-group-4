<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/sh/memberlogin.css" type="text/css">
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>




	
	<div class="Container">	   
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
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!--<div class="login">
		<form action="loginForm" method="post">
		<h2>로그인 </h2>
			<input type="button" value="회원" >
			<input type="button" value="기업"  onclick="location.href='Comlogin'"><p>
			아이디 : <input type="text" id="id" name="user_id" placeholder="아이디를 입력하세요"><p>
			비밀번호 : <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" ><p>
			<input type="submit" value="로그인">
			
			<div class="btn">			
						<input type="button" class="btn1" value="아이디 찾기" onclick="location.href='findId'">
						<input type="button" class="btn2" value="비밀번호 찾기" onclick="location.href='findPw'">
						<input type="button" class="btn3" value="회원가입" onclick="location.href='join'">
					</div>			
		</form>
	</div>

	</div> -->

</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>