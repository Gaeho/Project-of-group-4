<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="css/dj/tapstyle.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<title>검색 결과 페이지</title>
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body>
<!-- <div class="container"> -->
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="bigContainer_mainsearch">
	<div class="DjContainer">
			<div class="search_result_upper">
				<div class="search_title">
					<h1 class="h1-style">검색결과</h1>
					 <h4>검색어: ${mainsearch1}</h4><p>
				</div>
				
				<div class="search_result_search1"> 
					 <!-- 검색창 넣기  -->
					 	<form class="searchinput1233" id="contactForm"  action="search" method="post">
                            	 <div class="row">
                                		<div class="col">  
                                			<div class="input-group has-validation">                        
                                        		<input class="form-control form-control-lg" name="mainsearch" id="mainsearch" type="text" placeholder="검색어를 입력하세요" required="required" />
                                        		<div class="invalid-feedback">
												     검색어를 입력해주세요.
												</div>
                                        	</div> 
                                        </div>
                                        <div class="col-auto">               
                                    		<button class="btn btn-primary btn-lg" onsubmit="member_submit()" type="submit">검색</button>
                                    	</div>
                                  </div>  	
                            </form>
                            <script>
		                          //submit 눌렀을때 member_submit 함수 실행
		                            function member_submit(){
		                        	  alert('암튼 실행됨 이거');
		                              //값 비어있으면
		                              if($("#mainsearch").val() == ""){
		                                  // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
		                                  $("#mainsearch").addClass("is-invalid");
		                                  // 입력해야되는 창에 어그로
		                                  $("#mainsearch").focus();
		                                  return;
		                              }
		                              
		                              //submit 처리
		                            }       
                            </script>
					 <!--  -->
				</div>	
			</div>
			<div class="tab_content">
				<input type="radio" name="tabmenu" id="tab01" checked="checked">
				<label for="tab01">공고버튼 </label>
				<input type="radio"  name="tabmenu" id="tab02">
				<label for="tab02">회사버튼 </label>
			
					<div class="conbox con1">
							   <div class="anno_search_result">
								<table class="table">
									<tr>
										<th>이미지</th>
										<th>제목</th>
										<th>회사명</th>
										<th>직종</th>
										<th>경력</th>
										<th>학력사항</th>
										<th>고용형태</th>
										<th>고용인원</th>
									</tr>
									 <c:forEach var="annoResult" items="${annoResult}">
										<tr>
										    <td><img class="img-thumbnail" alt="이미지없음" src="${annoResult.com_img}" style="widows:50px; height:50px;">  </td>
											<td><a href="detail?anno_code=${annoResult.anno_code}">${annoResult.anno_title}</a></td>
											<td>${annoResult.com_name}</td>
											<td>${annoResult.jobgroup}</td>
											<td>${annoResult.workex}</td>
											<td>${annoResult.rec_edu}</td>
											<td>${annoResult.employform}</td>
											<td>${annoResult.rec_vol}</td>
										</tr>
									</c:forEach>
								</table>
								</div>
								
								
								
								<div class="page11">
									<input type="hidden" id="mainsearch" value="${mainsearch1}">
									<c:if test="${pg.startPage > pg.pageBlock }">
										<a href="search?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
									</c:if>
									<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
										<a href="#" onclick="pageMove(${i})">[${i}]</a>
									</c:forEach>
									<c:if test="${pg.endPage < pg.totalPage}">
										<a href="search?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
									</c:if>
									
									<script type="text/javascript">
									function pageMove(vCurrentpage){
										alert("vCurrentpage->"+vCurrentpage);
										var mainsearch = $('#mainsearch').val();
										alert("mainsearch->"+mainsearch);
										location.href="search?currentPage="+vCurrentPage+"&mainsearch="+mainsearch;
										}
													
								</script>
								</div>
					     </div> 
				
			   
			    <div class="conbox con2">
			    		<h2> 검색된 회사 </h2>
						   <h4>검색어: ${mainsearch1}</h4><p>
							<div class="com_search_result">
							<table class="table">
								<tr>
									<th>이미지</th>
									<th>회사명</th>
									<th>주소</th>
									<th>세부내용</th>
								</tr>
								 <c:forEach var="comResult" items="${comResult}">
									<tr>
									    <td><img class="img-thumbnail" alt="이미지없음" src="${comResult.com_img}" style="widows:50px; height:50px;"></td>
										<td><a href="#">${comResult.com_name}</a></td>
										<td>${comResult.com_addr}</td>
										<td>${comResult.com_bus}</td>
									</tr>
								</c:forEach>
							</table>
							</div>
							
							<!--  -->
							<script type="text/javascript">
							
							</script>
							<!--  -->
							<div class="page22">
							<input type="hidden" id="mainsearch2" value="${mainsearch1}">
								<c:if test="${pg.startPage > pg.pageBlock }">
									<a href="search?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
								</c:if>
								<c:forEach var="j" begin="${pg.startPage}" end="${pg.endPage}">
									<a href="#" onclick="pageMove2(${j})">[${j}]</a>
								</c:forEach>
								<c:if test="${pg.endPage < pg.totalPage}">
									<a href="search?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
								</c:if>
								
								<script type="text/javascript">
									function pageMove2(vCurrentpage1){
										alert("vCurrentpage1->"+vCurrentpage1);
										var mainsearch = $('#mainsearch2').val();
										alert("mainsearch->"+mainsearch);
										location.href="search?currentPage="+vCurrentPage1+"&mainsearch="+mainsearch;
										}
													
								</script>
							</div>
								    
				    </div>
				</div>
			</div>			
</div>	
<!-- </div> -->	

	
	
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>