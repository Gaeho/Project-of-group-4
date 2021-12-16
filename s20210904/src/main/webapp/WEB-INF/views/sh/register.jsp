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
<title>개인회원가입</title>
<link rel="stylesheet" href="css/sh/register.css" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    var contextPath='${pageContext.request.contextPath}';
	 /* ShMemberController */
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
						 alert("성공적으로 인증되었습니다. 가입누르시면되용");
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
<!-- 헤더부분 -->
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
     <body>
	
	
	   <div class="container">
		   <form action="joinSave">
				<h2>개인회원가입</h2>
		<input type="button" value="회원" >
		<input type="button" value="기업"  onclick="location.href='Comjoin'"><p>
		
		<!-- 아이디 적는 칸  -->
			<div class="registerFormWrapper">	
				<div class="registerFormRow">
					<div class="registerFormLabel">아이디</div>
						<div class="registerFormInputBox">
							<input type="text" id="id" name="user_id" placeholder="아이디입력하시오"><p>
					    </div>
				</div>
			
		
		<!-- 비밀번호 적는 칸 -->	
			<div class="registerFormRow">
				<div class="registerFormLabel">비밀번호</div>
					<div class="registerFormInputBox">		
		                <input type="password" name="user_pw" placeholder="비밀번호입력하시오"><p>
			        </div>
			</div>
		 
		 <!-- 이름 적는 칸 -->		
			 <div class="registerFormRow">
				 <div class="registerFormLabel">이름</div>	
					<div class="registerFormInputBox">		
		                <input type="text" name="user_name" placeholder="이름을 입력하시오"><p>
		            </div>
		     </div>
		 
		 <!-- 성별 적는 칸 -->	
			  <div class="registerFormRow">
				  <div class="registerFormLabel">성별</div>
					  <div class="registerFormInputBox">		
		                  <input type="radio" id="male" name="user_sex" value="m">
				          <label for="male">남성</label>
				          <input type="radio" id="female" name="user_sex" value="f">
			              <label for="female">여성</label><p>
				      </div>
			  </div>
		   
		   <!-- 생년월일 적는 칸 -->	  
				<div class="registerFormRow">
					 <div class="registerFormLabel">생년월일</div>	
						 <div class="registerFormInputBox">	
			                 <input type="text"  name="user_brh" placeholder="생년월일을 입력하시오"><p>
			             </div>
				</div>
			
			<!-- 학력 적는 칸 -->	  	
				 <div class="registerFormRow">
						<div class="registerFormLabel">학력</div>
						  <div class="registerFormInputBox">	
			                  <input type="text" name="user_edu" placeholder="학력을 입력하시오"><p>
			              </div>
				 </div>
			
			 <!-- 주소 적는 칸 -->  	
			     <div class="addrFormRow">	
			  	    <div class="form-group">
		         	   <div class="addrFormLabel">주소</div>
		         	   		<div class="addrFormInputBox" >        
                               <input class="form-control"  style="width: 50%; display: inline;" placeholder="우편번호" name="user_addr" id="addr1" type="text" readonly="readonly" >
                               <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
                            </div>
                     <div class="form-group">
                                <input class="form-control" style="top: 7px;" placeholder="도로명 주소" name="user_addr" id="addr2" type="text" readonly="readonly" />
                     </div>
                     <div class="form-group">
                                 <input class="form-control" placeholder="상세주소" name="user_addr" id="addr3" type="text"  />
                     	         <%@ include file="/WEB-INF/views/sh/ShAddr.jsp"%>
                     </div>
			  	   </div>   
			  	  </div>					  					  			
			  	
			  	<!-- 번호 적는 칸 -->		
					<div class="registerFormRow">
						  <div class="registerFormLabel">번호</div>
				                <div class="registerFormInputBox">	
		                             <input type="text" name="user_tel"  placeholder="번호를입력하시오">	<p>
		                        </div>
					</div>
						
				 <!-- 이메일 적는 칸 -->		
					  <div class="registerFormRow">
						   <div class="registerFormLabel">이메일</div>
						         <div class="registerFormInputBox">	
		                               <input type="text" name="user_email"   id="user_email"    placeholder="email입력하시오">
	                                   <input type="button" value="이메일 인증"  onclick="memberVerify()"><p>
	                                   
			 	                 </div>
					  </div>	
		             <input type="submit" value="회원가입"   disabled="disabled">
			  		</div>
			  </form>
		</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>		