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
<title>기업회원가입</title>
<link rel="stylesheet" href="css/sh/register.css" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    var contextPath='${pageContext.request.contextPath}';
	 /* ShMemberController */
	function memberVerify2(){
	/*alert("Vdeptno->"+Vdeptno); */
			var com_email = $('#com_email').val();
		//	var  submitId = document.getElementById('submitId');
			alert("com_email->"+com_email); 
			$.ajax({
				url:"<%=context%>/verifyEmail",
				data:{com_email : com_email},
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
<body>

	<div class="container">
		<form action="ComjoinSave">
		<h2>기업회원가입</h2>
		<input type="button" value="회원" onclick="location.href='join'">
		<input type="button" value="기업" ><p>
		
		<!-- 회사명 적는 칸 -->
			<div class="registerFormWrapper">
				<div class="registerFormRow">
					<div class="registerFormLabel">회사명</div>
					<div class="registerFormInputBox">
						<input type="text" name="com_name" placeholder="회사명을 입력하세요"><p>
					</div>
				</div>
			
		 <!-- 회사 주소 적는 칸 -->
			 <div class="addrFormRow">	
			  	    <div class="form-group">
		         	   <div class="addrFormLabel">회사주소</div>
		         	   		<div class="addrFormInputBox" >        
                               <input class="form-control"  style="width: 50%; display: inline;" placeholder="우편번호" name="com_addr" id="addr1" type="text" readonly="readonly" >
                               <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
                            </div>
                     <div class="form-group">
                                <input class="form-control" style="top: 7px;" placeholder="도로명 주소" name="com_addr" id="addr2" type="text" readonly="readonly" />
                     </div>
                     <div class="form-group">
                                 <input class="form-control" placeholder="상세주소" name="com_addr" id="addr3" type="text"  />
                     	         <%@ include file="/WEB-INF/views/sh/ShAddr.jsp"%>
                     </div>
			  	   </div>   
			  	  </div>		
			
		   <!-- 사업자 등록번호 적는 칸 -->	
				<div class="registerFormRow">
					<div class="registerFormLabel">사업자등록번호</div>
						<div class="registerFormInputBox">
								<input type="text" name="com_regnum"  placeholder="사업자등록번호를 입력하세요"><p>
						</div>
				</div>
			
			<!-- 기업 형태 적는 칸 -->
				 <div class="registerFormRow">
					 <div class="registerFormLabel">기업형태</div>
						 <div class="registerFormInputBox">
	   						   <input type="password" name="com_sec" placeholder="기업형태를 입력하세요 "><p>
						 </div>
				 </div>
			
				
						<hr class="two"><p><h3>인사담당자정보</h3>
				
			  <!-- 아이디 적는 칸 -->		
				   <div class="registerFormRow">
						<div class="registerFormLabel">아이디</div>
							<div class="registerFormInputBox">
	   								<input type="text" name="com_id" placeholder="아이디를 입력하세요"><p>
							</div>
				   </div>
			  
			  <!-- 비밀번호 적는 칸 -->
					<div class="registerFormRow">
						<div class="registerFormLabel">비밀번호</div>
							<div class="registerFormInputBox">
	   			 					<input type="text" name="com_pw" placeholder="비밀번호 입력하세요"><p>
							</div>
					</div>
			   
			   <!-- 가입자명 적는 칸 -->
					<div class="registerFormRow">
						<div class="registerFormLabel">가입자명</div>
							<div class="registerFormInputBox">
	   								<input type="text" name="com_user" placeholder="이름을 입력하세요"><p>
							</div>
					</div>
			
				<!-- 전화번호 적는 칸 -->
					 <div class="registerFormRow">
						<div class="registerFormLabel">전화번호</div>
							<div class="registerFormInputBox">
	   				  				<input type="text" name="com_mgr_tel" placeholder="전화번호를 입력하세요"><p>
							</div>
					 </div>
			
				 <!-- 이메일 적는 칸 -->
						<div class="registerFormRow">
							<div class="registerFormLabel">이메일</div>
								<div class="registerFormInputBox">
	                  				 <input type="text" name="com_email" placeholder="emiall입력하시오">
	                  				 <input type="button" value="이메일 인증"  onclick="memberVerify2()"><p>
							</div>
						</div>
					<input type="submit" value="회원가입"   disabled="disabled">
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>