<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="body">
<%@ include file="/WEB-INF/views/ds/AdminNav.jsp" %>
		<div class="QnABox">
			<span class="subject">QnA</span>
			<table class="boardTable">
				<tr class="title">
					<th>작성자</th><th>제목</th><th></th>
				</tr>
				<c:if test="${qtotCnt == 0 }">
					<tr>
						<td colspan="3">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${qtotCnt > 0 }">
					<c:forEach var="qList" items="${qnaList}">					
						<tr>
							<td>${qList.user_id}</td><td>${qList.post_title }</td><td><input type="button" value="답변하기" onclick="location.href='<%=context%>/postView?post_code=${qList.post_code}'"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<ul class="pageBtn">
					<li><c:if test="${pg.startPage > pg.pageBlock }">
						<a href="boardMenu?currentPage=${pg.startPage-pg.pageBlock}&currentPage2=${pg2.currentPage}">[이전]</a></c:if>
					</li>
					<li><c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<a href="boardMenu?currentPage=${i}&currentPage2=${pg2.currentPage}">[${i}]</a></c:forEach>
					</li>
					<li><c:if test="${pg.endPage < pg.totalPage }">
						<a href="boardMenu?currentPage=${pg.startPage+pg.pageBlock}&currentPage2=${pg2.currentPage}">[다음]</a></c:if>
					</li>
			</ul>
		</div>
		<div class="notice">
			<span class="subject">공지사항</span>
			
			<table class="boardTable">
				<tr class="title">
					<th>작성자</th><th>제목</th><th></th>
				</tr>
				<c:if test="${ntotCnt == 0 }">
					<tr>
						<td colspan="3">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ntotCnt > 0 }">
					<c:forEach var="nList" items="${noticeList}">					
						<tr>
							<td>${nList.user_id }</td><td>${nList.post_title }</td><td><input type="button" value="수정하기"
								onclick="location.href='<%=context%>/postUpdate?post_code=${nList.post_code}'"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<input type="button" value="작성하기" class="btn_notice" onclick="location.href='<%=context%>/postInsert'">
			<ul class="pageBtn">
						<li><c:if test="${pg2.startPage > pg2.pageBlock }">
							<a href="boardMenu?currentPage2=${pg2.startPage-pg2.pageBlock}&currentPage=${pg.currentPage}">[이전]</a></c:if>
						</li>
						<li><c:forEach var="i" begin="${pg2.startPage}" end="${pg2.endPage}">
							<a href="boardMenu?currentPage2=${i}&currentPage=${pg.currentPage}">[${i}]</a></c:forEach>
						</li>
						<li><c:if test="${pg2.endPage < pg2.totalPage }">
							<a href="boardMenu?currentPage2=${pg2.startPage+pg2.pageBlock}&currentPage=${pg.currentPage}">[다음]</a></c:if>
						</li>
			</ul>
		</div>
	</div>

</body>
</html>