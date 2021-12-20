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
		
			if(com_email==""){
				alert("이메일을 입력해 주세요.");
				 $('#com_email').foucs();
				return;
			}
			alert("com_email->"+com_email); 
			$.ajax({
				url:"<%=context%>/verifyEmail2",
				data:{com_email : com_email},
				dataType:'text',
				success:function(data){

					 if(data == '1') {
						 // tag를 풀어줌 
						 alert("이메일 인증번호를 입력해 주세요.");
							// submitId.disabled = true;
							 $('#emailAuthentication').prop('disabled', false);
							 $('#emailAuthBtn').prop('disabled', false);
					 } else{
						 // Dim Tag유지
						 alert("인증번호 발송이 실패하였습니다.이메일을 확인해주세요");
					 }
 			   }
		})
	} 
	

		 
		function emailAuth(){
			var authNumber = $('#emailAuthentication').val();
				$.ajax({
					url:"<%=context%>/emailAuthentication",
					type:"post",
					data:{authNumber : authNumber},
					dataType:'text',
					success:function(data){
						 if($.trim(data)== 'success') {
							 alert("인증이 완료되었습니다.");
							 $('input[type="submit"]').prop('disabled', false);						 
							 $('#emailAuthentication').prop('disabled', true);
						 } else{
							 alert("인증이 실패되었습니다.이메일을 확인해주세요");
						 }
	 			   }
			})
		} 	
 </script>
 </head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
			<div id="container">
					<div class="main">
						<div class="main__member">
							<h1>기업회원가입</h1>
							
							<div class="main__member__border"></div>
							<div class="main__btn">
								<button type="button" class="member"  onclick="location.href='join'">회원</button>
								<button type="button" class="company">기업</button>
							</div>
						</div>
						
						<form action="Comjoin" method="post" class="main__form">
			
							<!-- 회사명 적는 칸  -->
							<div class="main__form__top">
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_name">회사명</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="com_id"  name="com_id" placeholder="회사명을 입력하세요">
									</div>
								</div>
			
								<!-- 주소 적는 칸 --> <!--수리 중  -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_addr">주소</label>
									</div>
								
								<div class="form__find__right">
									<input type="text" id = "addr1" placeholder="우편번호"	 name="com_addr"   id ="addr1"    readonly="readonly">
									<button type="button" onclick="execPostCode();">우편번호 찾기</button>
								</div>
								
								<div class="form__find__right">	 
									<input type="text" id = "addr2" placeholder="도로명 주소"	 name="com_addr"  readonly="readonly">
									</div>
									
								<div class="form__find__right">	
									<input type="text"   placeholder="상세주소" >
									<%@ include file="/WEB-INF/views/sh/ShAddr2.jsp"%>
									</div>
								</div>
																
								<!-- 사업자 등록번호 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_regnum">사업자등록번호</label>
									</div>
			
									<div class="form__find__right">
										<input type="password" id="com_regnum" name="com_regnum" placeholder="사업자등록번호를 입력하세요">
									</div>
								</div>
								
								<p><h3>인사담당자정보</h3><div class="main__member__border"></div><p>
			
								<!-- 아이디 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_id">아이디</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="com_id"  name="com_id" placeholder="아이디를 입력하세요">
									</div>
								</div>
						
								<!--비밀번호 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_pw">비밀번호</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="com_pw" name="com_pw"  placeholder="비밀번호를 입력하세요">
									</div>
								</div>
			
								<!-- 가입자명 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_user">가입자명</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="com_user"  name="com_user" placeholder="가입자명을 입력하세요">
									</div>
								</div>
								
								<!-- 전화번호 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_mgr_tel">전화번호</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="com_mgr_tel" name="com_mgr_tel"  placeholder="가입자명을 입력하세요">
									</div>
								</div>
						
								<!-- 이메일 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="com_email">이메일</label>
									</div>
			
									<div class="form__find__right">
										<input type="email" id="com_email"  name="com_email" placeholder="이메일을 입력하세요">
										<button type="button" onclick="memberVerify2()">이메일 인증하기</button>
									</div>
								</div>
													
								<!-- 이메일 인증번호 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="email_check">이메일 인증번호</label>
									</div>
						
									<div class="form__find__right">
										<input type="email" name="emailAuthentication" id="emailAuthentication"
											placeholder="이메일 인증번호" disabled="disabled" style="width: 300px;">
										<button type="button"  value="인증번호 입력"  onclick="emailAuth()"
													id="emailAuthBtn" disabled="disabled">인증번호 입력</button>
										</div>
										
								</div><p>
						
						<div class="form__find__right2">			
						<input type="submit"  value="회원가입 "  disabled="disabled" >
						</div>
								</div>		
						</form>
					</div>
				</div>
					
<%@ include file="/WEB-INF/views/footer.jsp"%>
	 </body>
</html>