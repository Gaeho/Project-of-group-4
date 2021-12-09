<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업회원가입</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/sh/register.css" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
    var contextPath='${pageContext.request.contextPath}';
	
	/* ShMemberController */
	function memberVerify(){
	/*alert("Vdeptno->"+Vdeptno); */
			var user_email = $('#com_email').val();
			alert("com_email->"+com_email); 
			$.ajax({
				url:"<%=context%>/verifyEmail",
				data:{com_email : com_email},
				dataType:'text',
				success:function(data){
					 if(data ==1) {
						 // tag를 풀어줌 
						 alert("success ajax Data"+data);
					 
					 } else{
						 // Dim Tag유지
						 alert("Fail  ajax Data"+data);
					 }
 			   }
		})
	}
</script>	
</head>
<!-- 헤더부분 -->
<header>
<div id="container">
	<div class="header">	
		<div class="nav">
			<!--Logo Section -->
			<div class="nav_logo">
				<a href="#"><img src="images/logo.png" width="50px" height="50px"></a>
			</div>
			<!-- Search Section -->
			<form action="">
				<div class="search">
				<select class="search-cate" name="searchCate" size="1">
					    <option value="announce">공고</option>
						<option value="board">게시판</option>
				</select> 
					<input type="text" class="search-content" name="searchContent" placeholder="검색어 입력" required="required">
				</div>
			</form>
			<!--Menu Section -->
			<ul class="nav_menu">						
				<li><a href="">회원가입</a></li>																				
				<li><a href="">로그인</a></li>													
			</ul>		
		</div>
		<div class="nav2">
			<ul class="nav_menu2">						
				<li><a href="">채용정보</a></li>																				
				<li><a href="">게시판</a></li>													
			</ul>	
		</div>
	</div>
</div>
</header>
<body>

	<div class="container">
		<form action="ComjoinSave">
		<h2>기업회원가입</h2>
		<input type="button" value="회원" onclick="location.href='join'">
		<input type="button" value="기업" ><p>
		
			<div class="registerFormWrapper">
			<div class="registerFormRow">
				<div class="registerFormLabel">회사명</div>
				<div class="registerFormInputBox">
			<input type="text" name="com_name" placeholder="이름을 입력하시오"><p>
					</div>
					</div>
			
	
			<div class="registerFormRow">
				<div class="registerFormLabel">회사주소</div>
				<div class="registerFormInputBox">
			 <input type="text" name="com_addr" placeholder="주소를 입력하시오"><p>
					</div>
					</div>
			
				<div class="registerFormRow">
				<div class="registerFormLabel">사업자등록번호</div>
				<div class="registerFormInputBox">
		<input type="text" name="com_regnum"  placeholder="사업자등록번호를 입력하시오"><p>
					</div>
					</div>
			
			
					
			<div class="registerFormRow">
				<div class="registerFormLabel">기업형태</div>
				<div class="registerFormInputBox">
	   <input type="password" name="com_sec" placeholder="기업형태를 입력하시오 "><p>
					</div>
					</div>
			
						<hr class="two"><p><h3>인사담당자정보</h3>
						
				
			<div class="registerFormRow">
				<div class="registerFormLabel">아이디</div>
				<div class="registerFormInputBox">
	   		<input type="text" name="com_id" placeholder="아이디를 입력하시오"><p>
					</div>
					</div>
				
				
			<div class="registerFormRow">
				<div class="registerFormLabel">비밀번호</div>
				<div class="registerFormInputBox">
	   			 <input type="text" name="com_pw" placeholder="비밀번호입력하시오"><p>
					</div>
					</div>
			
			
			<div class="registerFormRow">
				<div class="registerFormLabel">가입자명</div>
				<div class="registerFormInputBox">
	   			<input type="text" name="com_user" placeholder="이름을 입력하시오"><p>
					</div>
					</div>
			
				
			<div class="registerFormRow">
				<div class="registerFormLabel">전화번호</div>
				<div class="registerFormInputBox">
	   				  <input type="text" name="com_mgr_tel" placeholder="tel입력하시오"><p>
					</div>
					</div>
		
				
			<div class="registerFormRow">
				<div class="registerFormLabel">이메일</div>
				<div class="registerFormInputBox">
	                  <input type="text" name="com_email"  id = "com_email"  placeholder="emial입력하시오"><p>
						   <input type="button" value="이메일 인증"  onclick="memberVerify()"><p>				
					
					</div>
					</div>
	
			<input type="submit" value="회원가입" disabled="disabled">
			
		</form>
	
	</div>
</body>
</html>