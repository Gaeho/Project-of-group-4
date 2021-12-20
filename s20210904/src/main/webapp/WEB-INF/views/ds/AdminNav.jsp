<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=context%>/css/ds/admin.css" type="text/css">
<link rel="stylesheet" href="<%=context%>/css/reset.css" type="text/css">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	window.onload=Adminalram;
	
	function Adminalram(){
		$.ajax({
			url:"<%=context%>/Adminalram",  
			dataType:'json',
			success:function(data){
				
				if(data.ComConfirmCnt >0){
					$(".ComdAlram").attr("src","<%=context%>/img/ds/on.png");					
				}else{
					$(".ComdAlram").attr("src","<%=context%>/img/ds/off.png");	
				}
				
				if(data.QnaListCnt >0){
					$(".QnaAlram").attr("src","<%=context%>/img/ds/on.png");					
				}else{
					$(".QnaAlram").attr("src","<%=context%>/img/ds/off.png");	
				}
			}
		});
	}
</script>
</head>
<body>
		<div class="nav">
			<div class="alram">
				<span class="alram_btn"> <img src="#" class="QnaAlram" width ="25px" height="25px"><a href="boardMenu" >미답변</a>&nbsp;&nbsp;
										 <img src="#" class="ComdAlram" width ="25px" height="25px"><a href="companyMenu">미승인</a>
				</span>
			</div>
			<div class=navBtn>
				<a href="<%=context%>/main" class="logo"><span><img src="<%=context%>/img/ds/logo.png" width="100%" height="50px"></span></a>
				<hr class="line"> 
				<a href="AdminMain"><span>대시보드</span></a>
				<hr class="line">
				<a href="memberMenu"><span>회원관리</span></a>
				<hr class="line">
				<a href="companyMenu"><span>기업관리</span></a>
				<hr class="line">
			 	<a href="tagMenu"><span>태그관리</span></a>
			 	<hr class="line">
			 	<a href="boardMenu"><span>게시판관리</span></a>
			 </div>
		</div>
</body>
</html>