<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>        
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function resume_delete(res_code){
		if(confirm("이력서를 삭제하시겠습니까 ?") == true){
			$.ajax({
				url:"<%=context%>/mbMypageResumeDelete",
				data:{res_code : res_code},
				dataType:'text',
				success:function(data){
					if(data>0){
						alert("삭제되었습니다");
						location.replace("mbMypageResume");
					}else{
						alert("삭제 실패"+data);
					}
				},
				error:function(){
					alert("삭제에 실패하였습니다"+data);
				}
			});
		}else{
			return ;
		}
	}
	
	// 대표이력서 해제
	function rep_resume_del(res_code){
		$.ajax({
			url:"/mbMypageRepResumeDelete",
			type: "POST",
			data:{res_code : res_code},
			dataType:'text',
			success:function(data){
				if(data>0){
					alert("대표이력서 해제되었습니다");	
					location.replace("mbMypageResume");
				}else{
					alert("해제 실패"+data);
				}
			},
			error:function(){
				alert("대표이력서 해제에 실패하였습니다"+data);
			}
		});
	}
	
	// 대표이력서 설정
	function rep_resume(res_code){
		var rep_res_code=0;
		rep_res_code=document.getElementById('rep_res').value;
		alert("rep_res_code : "+rep_res_code);
		
		if(rep_res_code != "0"){
			alert("test1");
			rep_resume_del(rep_res_code);
		}
		$.ajax({
			url:"/mbMypageRepResume",
			type: "POST",
			data:{"res_code" : res_code},	/* , "rep_res_code" : rep_res_code */
			dataType:'text',
			success:function(data){
				if(data>0){
					alert("대표이력서로 설정되었습니다");
					location.replace("mbMypageResume");
				}else{
					alert("설정 실패"+data);
				}
			},
			error:function(){
				alert("대표이력서 설정에 실패하였습니다"+data);
			}
		});
	}

/* 	function resume_update(res_code){	
		alert("11");
		var form=document.paging; 				//폼 name
	    form.res_code.value = res_code; 		//POST방식으로 넘기고 싶은 값
	    
	    form.action = "mbMypageResumeUpdate";
        form.method = "post"; 
        form.submit();
	} */




</script>

 </head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<h1>mbMypageResume</h1><p><p>

${mbid }의 이력서<br>
<c:if test="${not empty msg}">${msg }<br> </c:if>

<c:forEach var="resumelist" items="${resumelist}" varStatus="status">
	${status.count} &nbsp;&nbsp; ${resumelist.res_title} &nbsp;&nbsp; ${resumelist.res_date} &nbsp;&nbsp; 
	
	<c:if test="${resumelist.rep_res eq 1}">
		대표이력서&nbsp;&nbsp; &nbsp;&nbsp; 
		<input type="button" value="대표이력서 해제" onclick="rep_resume_del(${resumelist.res_code})">
		<input type="hidden" id="rep_res" value="${resumelist.res_code}">
	</c:if>
	<c:if test="${resumelist.rep_res eq 0}">
		&nbsp;&nbsp; &nbsp;&nbsp; 
		<input type="button" value="대표이력서로 설정" onclick="rep_resume(${resumelist.res_code})">
	</c:if>
	&nbsp;&nbsp; &nbsp;&nbsp; <input type="submit" onclick="location.href='mbMypageResumeUpdate?res_code=${resumelist.res_code}'" value="수정">
	&nbsp;&nbsp; &nbsp;&nbsp; <input type="button" onclick="resume_delete(${resumelist.res_code})" value="삭제"><br>
</c:forEach><p>
<input type="hidden" id="rep_res" value="0">
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>