<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Landing Page - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 알람입니당 -->
<script type="text/javascript">
window.onload=function alramList(){
	str = "";
	$.ajax({
		url:"alramList",
		data:{id : '${id}'},
		dataType:'json',
		success:function(data){
			if(data.length >0){
				/* alert("알람ON"+data); */	
				$("#alramImg").attr("src","img/ds/alram-on.png");
				
				$(data).each(
						function(){
							if(this.ntc_ctg == '001'){
								str +="<li><a class='dropdown-item' href='#scrollspyHeading3'>["+this.anno_title+"]공고에 "+this.apply_id+"]님이 지원했습니다</a></li>"
									 +"<li><hr class='dropdown-divider'></li>";
							}else if(this.ntc_ctg =='002'){
								str += "<li><a class='dropdown-item' href='mbMypageApply'>지원하신 ["+this.anno_title+"] 공고에 "+this.app_sts+"하셨습니다</a></li>"
									  +"<li><hr class='dropdown-divider'></li>";
							}else if(this.ntc_ctg =='003'){
								str += "<li><a class='dropdown-item' href='mbMypageApply?notice_msg=2'>["+this.com_name+"]님이 ["+this.read_res+"]를 조회했습니다</a></li>"
									  +"<li><hr class='dropdown-divider'></li>";	
							}
						}
				)	
			}else{
				/* alert("알람OFF"+data); */
				$("#alramImg").attr("src","img/ds/alram-off.png");
				str = "<li><hr class='dropdown-divider'></li>"
				+"<li><a class='dropdown-item' href='#scrollspyHeading3'>알림이 없어요~</a></li>"
				+"<li><hr class='dropdown-divider'></li>";
			}
			$('.dropdown-menu').append(str);
			
			
		}
	});
}
</script>
<script type="text/javascript">
		var myModal = document.getElementById('myModal')
		var myInput = document.getElementById('myInput')
		
		myModal.addEventListener('shown.bs.modal', function () {
		  myInput.focus()
		})
</script>
</head>
<body>
  <!-- Navigation-->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="main">Codingmon</a>
                <ul class="nav nav-pills">
                    <li class="nav-item">
                      <a class="nav-link" href="GmAnnoList">공고</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="postList">게시판</a>
                    </li>
              </ul>
              id = ${id } cnt = ${cnt }
              <c:choose>
              	<c:when test="${id == null || id =='' }"> 					<!-- 로그인 NO -->
              		<a class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#exampleModal">Login</a>
              		<!-- href="login" -->
             
              		<!-- 모달 실행 관련 -->
              			<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        
							        <form action="loginForm"  method="post">
		       
										<input type="button" value="회원" >
										<input type="button" value="기업"  onclick="location.href='Comlogin'"><p>
										
										아이디 : <input type="text" id="id" name="user_id" placeholder="아이디를 입력하세요"><p>
										
										비밀번호 : <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" ><p>
									
										<input type="submit" value="로그인">
										
										<div class="btn">			
											<input type="button" class="btn1" value="아이디 찾기" onclick="location.href='findId'">
											<input type="button" class="btn2" value="비밀번호 찾기" onclick="location.href='findPw'"><p>
											<img src="C:/Team project employment/Project-of-group-4/s20210904/src/main/webapp/upload/sh"  onclick="location.href='join'">
											 <input type="button" class="btn3" value="회원가입" onclick="location.href='join'">
										</div>			
									</form> 
							        
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary">Save changes</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
	
              	</c:when>
              	<c:when test="${id == 'rhksflwk0000'}">						<!-- 관리자 한명만있음ㅋ -->
              		<ul class="nav">
              			<li><a class="btn btn-primary" href="logout">Logout</a></li>
              			<li><a class="btn btn-primary btn-mypage" href="admin/AdminMain">Admin</a><li>
              			
              		</ul>
              	</c:when>
              	<c:otherwise>						<!-- 로그인 OK -->
              		<ul class="nav">
						<li class="nav-item dropdown">
							<a	class="nav-link" data-bs-toggle="dropdown"	href="#" role="button" aria-expanded="false"><img src="img/ds/alram-on.png" width="30px" height="30px" id="alramImg"></a>
							<ul class="dropdown-menu">
							</ul>
						</li>
						<li><a class="btn btn-primary" href="logout">Logout</a></li>
              			<li><a class="btn btn-primary btn-mypage" href="myPage?grade=${grade}">MyPage</a><li>
              		</ul>
              	</c:otherwise>
              </c:choose>
            </div>
        </nav>
</body>
