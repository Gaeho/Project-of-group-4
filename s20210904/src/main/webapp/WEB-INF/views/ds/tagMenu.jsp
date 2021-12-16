<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<%
	String context1 = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function modalOn() {
		document.querySelector(".modalBack").style.display="flex";
	}
	function modalOff() {
		document.querySelector(".modalBack").style.display="none";
	}
	
	function maxSubCate(VmainCate){
		$.ajax({
			url:"<%=context1%>/maxSubCate",
			data:{mainCate : VmainCate},
			dataType:'text',
			success:function(data){
				alert(data+"성공");
				$('.subCate').val(data);
				$(".subCate").attr("readonly",true);
			}
		});
	}
</script>
<body>
	<div class="body">
<%@ include file="/WEB-INF/views/ds/AdminNav.jsp" %>
		<div id="memberListbox" class="memberListbox" >
				<span class="subject">태그관리</span>
				<span class="search">
						<select onchange="location.href='tagMenu?main_cat='+this.value">
							<option value="0">전체</option>
							<c:forEach var="mainCate" items="${mainCate }">
								<option value="${mainCate.main_cat}">${mainCate.comm_ctx}</option>
							</c:forEach>
						</select>
				</span>
				<span class="addTag"><input type="button" value="태그추가" onclick="modalOn()"></span>
				<table class="tagList">
					<tr class="title">
						<th >태그명</th><th>번호</th><th>분류</th><th></th>
					</tr>
					<c:if test="${ttotCnt==0 }">
						<tr><td>회원목록이 비어있어욤</td></tr>
					</c:if>
					<c:if test="${ttotCnt > 0 }">
						<c:forEach var="tagList" items="${dsCommList}">
							<tr>
								<td>${tagList.comm_ctx}</td><td>${tagList.sub_cat}</td><td>${tagList.comm_ctx2}</td><td><input type="button" value="삭제" onclick="location.href='<%=context1%>/tagDel?main_cat=${tagList.main_cat}&sub_cat=${tagList.sub_cat}'"></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<ul class="pageBtn">
					<li><c:if test="${pg.startPage > pg.pageBlock }">
						<a href="tagMenu?currentPage=${pg.startPage-pg.pageBlock}&main_cat=${main_cat}">[이전]</a></c:if>
					</li>
					<li><c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<a href="tagMenu?currentPage=${i}&main_cat=${main_cat}">[${i}]</a></c:forEach>
					</li>
					<li><c:if test="${pg.endPage < pg.totalPage }">
						<a href="tagMenu?currentPage=${pg.startPage+pg.pageBlock}&main_cat=${main_cat}">[다음]</a></c:if>
					</li>
				</ul>

		</div>
	</div>
	<div class="modalBack">
			<form action="<%=context%>/tagInsert">
				<div class="modal">
					<span>대번호 					
						<select onchange="maxSubCate(this.value)" name="main_cat">
							<c:forEach var="mainCate" items="${mainCate }">
								<option value="${mainCate.main_cat}">${mainCate.comm_ctx}</option>
							</c:forEach>
						</select>
					</span>
					<span>중번호 <input type="text" class="subCate" name="sub_cat" required="required" readonly="readonly"></span>
					<span>태그명 <input type="text" class="tagName" name="comm_ctx" required="required"></span>
					<div class="modalBtn"><input type="submit" value="추가하기"><input type="button" value="취소" onclick="modalOff()"></div>
				</div>
			</form>

	</div>
</body>
</html>