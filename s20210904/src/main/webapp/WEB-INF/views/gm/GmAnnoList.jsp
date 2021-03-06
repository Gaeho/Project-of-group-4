<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/gm/GmAnnoList.css" rel="stylesheet" type="text/css">
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<title>코딩몬</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	/* pageMove */
	function pageMove(vCurrentPage){
		// console.log(vCurrentPage);
    		/* alert("vCurrentPage->"+vCurrentPage);  */ 
		var  annosearch = $('#annosearch').val();
		/*  alert("annosearch->"+annosearch);  */
		location.href="GmAnnoList?currentPage="+vCurrentPage+"&annosearch="+annosearch;
	}

</script>

</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-------------------------------------------------------------------------------------------------------->
<div class="container">
	<div class="annolistContainer">
		<div class="annolist1">
				<div class="annolisttitle">
					<h2 class="h2-style"> 공고 </h2>
				</div>
				
				<div class="annolist1">
					<table class="table table-hover">
							<thead class="table-light">				
								<tr>
									<th scope="col">기업명</th>
									<th scope="col" colspan="2">제목</th>
									<th scope="col">지원자격</th>
									<th scope="col">등록일</th>
									<th scope="col">마감일</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach var="comanno" items="${listAnno}">
									<tr>
									    <td>${comanno.com_name}</td>
										<td colspan="2"><a href="detail?anno_code=${comanno.anno_code}&user_id=${id}">${comanno.anno_title}</a></td>
										<td>${comanno.rec_edu}</td>
										<td>${comanno.anno_regdate} ~</td>
										<td>${comanno.anno_c_regdate}</td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
				</div>
				<div>
					<div class="anno_search1">
						
<!-- 							
 -->						<form action="GmAnnoList" method="post">
 							 <div class="searchset11">	
							 	<div><input type="hidden" name="currentPage" value="${pg.currentPage}" ></div>
							  	<div><input type="text" class="form-control" value="${annosearch1}" name="annosearch" id="annosearch" placeholder="검색어를 입력하세요" style="width:300px"></div>
								<div><button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button></div>
							 </div>
							</form>
						
					</div>
				</div>
				<div class="anno_paging_container">
					<div class="annolistpage">
							<c:if test="${pg.startPage > pg.pageBlock }">
								<a href="GmAnnoList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
								</c:if>
							<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
								<a href="#" onclick="pageMove(${i})">[${i}]</a>
							</c:forEach>
							<c:if test="${pg.endPage < pg.totalPage}">
								<a href="GmAnnoList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
							</c:if>
					</div>
				</div>
				
			</div>	
		</div>	
	</div>
		
	
	<!-------------------------------------------------------------------------------------------------------->
	<br><br><br>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>