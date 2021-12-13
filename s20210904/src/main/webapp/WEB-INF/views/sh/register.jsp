 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입(개인 , 기업)</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/sh/register.css" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
    var contextPath='${pageContext.request.contextPath}';
	
    /* ShMemberController (회원가입 이메일 인증 로직) */
	function memberVerify(){
	/*alert("Vdeptno->"+Vdeptno); */
			var user_email = $('#user_email').val();
		//	var  submitId = document.getElementById('submitId');
			alert("user_email->"+user_email); 
			$.ajax({
				url:"<%=context%>/verifyEmail",
				data:{user_email : user_email},
				dataType:'text',
				success:function(data){
					 if(data == '1') {
						 // tag를 풀어줌 
						 alert("성공적으로 인증되었습니다");
						// submitId.disabled = true;
						 $('input[type="submit"]').prop('disabled', false);
					 } else{
						 // Dim Tag유지
						 alert("인증이 실패되었습니다.이메일을 확인해주세요");
					 }
 			   }
		})
	}
    
	 /* ShMemberController (기업가입 이메일 인증 로직) */
	function memberVerify2(){
	/*alert("Vdeptno->"+Vdeptno); */
			var com_email = $('#com_email').val();
		//	var  submitId = document.getElementById('submitId');
			alert("com_email->"+com_email); 
			$.ajax({
				url:"<%=context%>/verifyEmail2",
				data:{com_email : com_email},
				dataType:'text',
				success:function(data){
					 if(data == '1') {
						 // tag를 풀어줌 
						 alert("성공적으로 인증되었습니다");
						// submitId.disabled = true;
						 $('input[type="submit"]').prop('disabled', false);
					 } else{
						 // Dim Tag유지
						 alert("인증이 실패되었습니다.이메일을 확인해주세요");
					 }
 			   }
		})
	}
 </script>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>
	
	
		<div class="register">
		<form action="joinSave">
		<h2>회원가입</h2>
		<input type="button" value="회원" >
		<input type="button" value="기업"  onclick="location.href='Comjoin'"><p>
		
		<div class="registerFormWrapper">	
			<div class="registerFormRow">
				<div class="registerFormLabel">아이디</div>
				<div class="registerFormInputBox">
					<input type="text" id="id" name="user_id" placeholder="아이디입력하시오"><p>
					</div>
					</div>
			
			<div class="registerFormRow">
						<div class="registerFormLabel">비밀번호</div>
						<div class="registerFormInputBox">		
		 <input type="password" name="user_pw" placeholder="비밀번호입력하시오"><p>
			</div>
					</div>
				
				<div class="registerFormRow">
						<div class="registerFormLabel">이름</div>	
						<div class="registerFormInputBox">		
		 <input type="text" name="user_name" placeholder="이름을 입력하시오"><p>
		</div>
					</div>
				<div class="registerFormRow">
						<div class="registerFormLabel">성별</div>
							<div class="registerFormInputBox">		
		 <input type="radio" id="male" name="user_sex" value="m">
				 <label for="male">남성</label>
				 <input type="radio" id="female" name="user_sex" value="f">
				 <label for="female">여성</label><p>
				 		
		 <input type="submit" value="회원가입">
				 </div>
					</div>
				 <div class="registerFormRow">
						<div class="registerFormLabel">생년월일</div>	
							<div class="registerFormInputBox">	
			  <input type="text"  name="user_brh" placeholder="생년월일을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">학력</div>
							<div class="registerFormInputBox">	
			  <input type="text" name="user_edu" placeholder="학력을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">주소</div>
						<div class="registerFormInputBox">	
			<input type="text" name="user_addr" placeholder="주소를 입력하시오"><p>
			</div>
					</div>
						 <div class="registerFormRow">
						<div class="registerFormLabel">번호</div>
				        <div class="registerFormInputBox">	
		<input type="text" name="user_tel" placeholder="번호를입력하시오">	<p>
		</div>
					</div>
						<div class="registerFormRow">
						<div class="registerFormLabel">이메일</div>
						 <div class="registerFormInputBox">	
		<input type="text" name="user_email"   id="user_email"    placeholder="email입력하시오">
	    <input type="button" value="이메일 인증"  onclick="memberVerify()"><p>
			 	</div>
					</div>	
		 <input type="submit" value="회원가입"   disabled="disabled">
			
		</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- <div class="Container">	   
				<div class="tab_content">
					<div class="register">
					    <form action="joinSave">	
						<input type="radio" name="tabmenu" id="tab01" checked="checked">
						<label for="tab01">개인회원가입</label>
						<input type="radio"  name="tabmenu" id="tab02">
						<label for="tab02">기업 회원가입</label>
							
								      <div class="conbox con1">
										 아이디 :     <input type="text" id="id" name="user_id" placeholder="아이디를 입력하세요"><p>
								     	 비밀번호 : <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" ><p>
									     이름 :  <input type="text"  name="user_name"  placeholder="이름을 입력하세요"><p>
									     성별 :  <input type="radio"  id="male"  name="user_sex" value="m">
									                <label for="male">남성</label>
				                                    <input type="radio" id="female" name="user_sex" value="f">
				                                    <label for="female">여성</label><p>
				                          생년 월일 : <input type="text"  name="user_brh" placeholder="생년월일을 입력하세오"><p>
				                           학력 : <input type="text" name="user_edu" placeholder="학력을 입력하세오"><p>
				                           주소 : <input type="text" name="user_addr" placeholder="주소를 입력하세오"><p>    
				                           번호 : <input type="text" name="user_tel" placeholder="번호를입력하세오">	<p>        
				                           이메일 : <input type="text" name="user_email"   id="user_email"    placeholder="email을 입력하세오">
	                                                    <input type="button" value="이메일 인증"  onclick="memberVerify()"><p>
									                     
									                    <input type="submit" value="회원가입"   disabled="disabled">
						              </div> 
							</form>
					</div>
			   				
			                          <div class="conbox con2">
			                          		<form action="ComjoinSave">
			    		 				회사명 :   <input type="text" name="com_name" placeholder="이름을 입력하세요"><p>
										회사주소 : <input type="text" name="com_addr" placeholder="주소를 입력하세요"><p>
										사업자 등록번호 : <input type="text" name="com_regnum"  placeholder="사업자등록번호를 입력하세요"><p>
										기업형태 :  <input type="password" name="com_sec" placeholder="기업형태를 입력하세요 "><p>
										
										<hr class="two"><p><h3>인사담당자정보</h3>
										
										아이디 : <input type="text" name="com_id" placeholder="아이디를 입력하세요"><p>
										비밀번호 :  <input type="text" name="com_pw" placeholder="비밀번호입력하세요"><p>
										가입자 명 : <input type="text" name="com_user" placeholder="가입자명을 입력하세요"><p>
										전화번호 :  <input type="text" name="com_mgr_tel" placeholder="번호를 입력하세요"><p>
										이메일 :  <input type="text" name="com_email" placeholder="emial입력하시요">
													  <input type="button" value="이메일 인증"  onclick="memberVerify2()"><p>
										                  
										                 <input type="submit" value="회원가입"   disabled="disabled">
										
								              </form>
				                    </div>
			    </div>       
		</div>	 -->

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!--  <div class="register">
		<form action="joinSave">
		<h2>회원가입</h2>
		<input type="button" value="회원" >
		<input type="button" value="기업"  onclick="location.href='Comjoin'"><p>
		
		<div class="registerFormWrapper">	
			<div class="registerFormRow">
				<div class="registerFormLabel">아이디</div>
				<div class="registerFormInputBox">
					<input type="text" id="id" name="user_id" placeholder="아이디입력하시오"><p>
					</div>
					</div>
			
			<div class="registerFormRow">
						<div class="registerFormLabel">비밀번호</div>
						<div class="registerFormInputBox">		
		 <input type="password" name="user_pw" placeholder="비밀번호입력하시오"><p>
			</div>
					</div>
				
				<div class="registerFormRow">
						<div class="registerFormLabel">이름</div>	
						<div class="registerFormInputBox">		
		 <input type="text" name="user_name" placeholder="이름을 입력하시오"><p>
		</div>
					</div>
				<div class="registerFormRow">
						<div class="registerFormLabel">성별</div>
							<div class="registerFormInputBox">		
		 <input type="radio" id="male" name="user_sex" value="m">
				 <label for="male">남성</label>
				 <input type="radio" id="female" name="user_sex" value="f">
				 <label for="female">여성</label><p>
				 		
		 <input type="submit" value="회원가입">
				 </div>
					</div>
				 <div class="registerFormRow">
						<div class="registerFormLabel">생년월일</div>	
							<div class="registerFormInputBox">	
			  <input type="text"  name="user_brh" placeholder="생년월일을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">학력</div>
							<div class="registerFormInputBox">	
			  <input type="text" name="user_edu" placeholder="학력을 입력하시오"><p>
			  </div>
					</div>
			  			 <div class="registerFormRow">
						<div class="registerFormLabel">주소</div>
						<div class="registerFormInputBox">	
			<input type="text" name="user_addr" placeholder="주소를 입력하시오"><p>
			</div>
					</div>
						 <div class="registerFormRow">
						<div class="registerFormLabel">번호</div>
				        <div class="registerFormInputBox">	
		<input type="text" name="user_tel" placeholder="번호를입력하시오">	<p>
		</div>
					</div>
						<div class="registerFormRow">
						<div class="registerFormLabel">이메일</div>
						 <div class="registerFormInputBox">	
		<input type="text" name="user_email"   id="user_email"    placeholder="email입력하시오">
	    <input type="button" value="이메일 인증"  onclick="memberVerify()"><p>
			 	</div>
					</div>	
		 <input type="submit" value="회원가입"   disabled="disabled">
			
		</form>
		
		
</div>-->	
</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>	
		
		