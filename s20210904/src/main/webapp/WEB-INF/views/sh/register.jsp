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
		
			if(user_email==""){
				alert("이메일을 입력해 주세요.");
				 $('#user_email').foucs();
				return;
			}
			alert("user_email-> "+user_email); 
			
			$.ajax({
				url:"<%=context%>/verifyEmail",
				data:{user_email : user_email},
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
						 alert("인증이 완료되었습니다!!");
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
							<h1>개인회원가입</h1>
							
							<div class="main__member__border"></div>
							<div class="main__btn">
								<button type="button" class="member">회원</button>
								<button type="button" class="company"
									onclick="location.href='Comjoin'">기업</button>
							</div>
						</div>
						
						<form action="join" method="post" class="main__form">
			
								<!-- 아이디 적는 칸  -->
								<div class="main__form__top">
									<div class="main__form__find">
										<div class="form__find__left">
											<label for="user_id">아이디</label>
										</div>
			
										<div class="form__find__right">
											<input type="text" id="user_id" placeholder="아이디를 입력하세요">
										</div>
									</div>
			
								<!-- 비밀번호 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_pw">비밀번호</label>
									</div>
			
									<div class="form__find__right">
										<input type="password" id="user_pw" placeholder="비밀번호를 입력하세요">
									</div>
								 </div>
			
								<!-- 이름 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_name">이름</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="user_name" placeholder="이름을 입력하세요">
									</div>
								</div>
			
								<!-- 성별 적는 칸 -->
									<div class="main__form__find">
										<div class="form__find__left">
											<p>성별</p>
										</div>
										
										<div class="form__find__right">
											<div class="main__form__sex">
												<div class="form__sex__box">
													<label for="1"> <input type="radio" id="1"
														name="user_sex">
														<p>남성</p>
													</label>
												</div>
				
												<div class="form__sex__box">
													<label for="2"> <input type="radio" id="2"
														name="user_sex">
														<p>여성</p>
													</label>
												</div>
											 
											 </div>
										  </div>
									 </div>
			
								<!-- 생년월일 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_brh">생년월일</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="user_brh" placeholder="생년월일을 입력하세요">
									</div>
								</div>
			
								<!-- 주소 적는 칸 --> <!--수리 중  -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_addr">주소</label>
									</div>
								<div class="form__find__right">
									<input type="text" id = "addr1" placeholder="우편번호"	 name="user_addr">
									<button type="button" onclick="execPostCode();">우편번호 찾기</button>
								</div>
								<div class="form__find__right">	 
									<input type="text" id = "addr2" placeholder="도로명 주소"	 name="user_addr">
									</div>
									<div class="form__find__right">	
									<input type="text" id="addr3" name="user_addr"  placeholder="상세주소">
									</div>
									
									<!-- <div class="form__find__right">
										<input type="text" id="user_addr"  name="user_addr" id="addr1" placeholder="우편번호">
									</div>
									<button type="button"  onclick="execPostCode();" >우편번호 찾기</button>  -->
											
											<%-- <input class="form-control" style="width: 50%; display: inline;"
												placeholder="우편번호" name="user_addr" id="addr1" type="text"
												readonly="readonly">
											<button type="button" class="btn btn-default"
												onclick="execPostCode();">
												<i class="fa fa-search"></i> 우편번호 찾기
											</button>
										<div class="form-group">
											<input class="form-control" style="top: 7px;"
												placeholder="도로명 주소" name="user_addr" id="addr2" type="text"
												readonly="readonly" />
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="상세주소" name="user_addr"
												id="addr3" type="text" />
											<%@ include file="/WEB-INF/views/sh/ShAddr.jsp"%>
										</div> --%>
									</div>
								
			
								<!-- 번호 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_tel">전화번호</label>
									</div>
			
									<div class="form__find__right">
										<input type="text" id="user_tel" placeholder="전화번호를 입력하세요">
									</div>
								</div>
			
			
								<!-- 이메일 적는 칸 -->
								<div class="main__form__find">
									<div class="form__find__left">
										<label for="user_email">이메일</label>
									</div>
			
									<div class="form__find__right">
										<input type="email" id="user_email" placeholder="이메일을 입력하세요">
										<button type="button" onclick="memberVerify()">이메일 인증하기</button>
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
									
									<div class="form__find__right">			
									<button type="submit"  value="회원가입 "  disabled="disabled" >회원가입</button>
									</div>
											
								</div>		
							</form>
						</div>
					</div>
							
					<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>		