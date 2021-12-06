<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp01.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	var car_code_num=${fn:length(resumeDetailList) };
	var addResAppend="";
	$(document).ready( function() {
    	$(document).on("click", "#addResumeDetail", function() {
    		//alert(car_code_num);
      		addResAppend="<div id='resDetail"+car_code_num+"'>"
      					+"회사명 <input type='text' name='com_name_ar[]' placeholder ='회사명을 입력해주세요'><br>"
						+"근무기간  <input type='date' name='emp_date1_ar[]'> - <input type='date' name='emp_date2_ar[]'><br>"
						+"근무부서 <input type='text' name='emp_dept_ar[]' placeholder ='부서명을 입력해주세요'><br>"
						+"담당업무 <input type='text' name='task_ar[]' placeholder ='담당한 업무를 입력해주세요'>&nbsp;&nbsp;&nbsp;"
						+"<input type='button' value='경력사항 삭제' id='deleteResDetail' onclick='deleteResumeDetail("+car_code_num+")'><p>"
						+"<input type='hidden' name='car_code_ar[]' value='"+car_code_num+"'><p></div>";
      		$("#resumeDetail").append(addResAppend);
      		car_code_num+=1;
    	});
  	});
	
	function deleteResumeDetail(car_code_num){
		alert(car_code_num);
		$("#resDetail"+car_code_num).remove();
	}
</script>
</head>
<body>
<h1>mbMypageResumeUpdate</h1><p>
<c:if test="${res_select_msg eq false }">
 없는 이력서 입니다
</c:if>

<c:if test="${res_select_msg eq true }">
	<form action="mbMypageResumeUpdatePro" method="post">
		<input type="hidden" value="${mbid }" name="user_id">
		<input type='hidden' value="${resumedetail.rep_res }" name="rep_res">
		<input type='hidden' value="${resumedetail.res_code }" name="res_code">
	
		이력서 제목 <input type="text" name="res_title" value="${resumedetail.res_title }" required="required"><p>
		이름 : ${memberdetail.user_name }<br>
		전화번호 : ${memberdetail.user_tel }<br>
		주소 : ${memberdetail.user_addr }<p>
	
		이메일 : <input type="text" name="res_email" value="${resumedetail.res_email }"><p>
		
		자기소개<br>
		<textarea rows="10" cols="40" name="cov_let" >${resumedetail.cov_let }</textarea><p>
		
		학력사항<br>
		<c:if test="${memberdetail.user_edu >= 2 }">
			&nbsp;&nbsp;고등학교<br>
			학교명 <input type="text" name="hs_name" value="${resumedetail.hs_name }"><br>
			전공계열 
			<select name="hs_mjr">
				<c:forEach var="commlist" items="${commlist }">
					<c:if test="${resumedetail.hs_mjr eq commlist.sub_cat }">
						<option value="${commlist.sub_cat }" selected="selected">${commlist.comm_ctx }</option>
					</c:if>
					<c:if test="${resumedetail.hs_mjr ne commlist.sub_cat }">
						<option value="${commlist.sub_cat }">${commlist.comm_ctx }</option>
					</c:if>
				</c:forEach>
			</select> 
			<p>
		</c:if>
		<c:if test="${memberdetail.user_edu >= 3 }">
			&nbsp;&nbsp;대학교, 대학원<br>
			학교명 <input type="text" name="univ_name" value="${resumedetail.univ_name }"><br>
			재학기간 <input type="date" name="univ_date1" value="${univ_date1 }"> - <input type="date" name="univ_date2" value="${univ_date2 }"><br>
			전공 <input type="text" name="univ_mjr" value="${resumedetail.univ_mjr }"><p>
		</c:if>
		test: ${fn:length(resumeDetailList) }
		<p>
		경력사항 	
		<c:forEach var="resumeDetailList" items="${resumeDetailList}" varStatus="status">
			<div id="resDetail${resumeDetailList.car_code }">
				
				회사명 <input type='text' name='com_name_ar[]' value="${resumeDetailList.com_name }"><br>
				근무기간  <input type='date' name='emp_date1_ar[]' value="emp_date1(0)"> - <input type='date' name='emp_date2_ar[]' value="emp_date2(0)"><br>
				근무부서 <input type='text' name='emp_dept_ar[]' value="${resumeDetailList.emp_dept }"><br>
				담당업무 <input type='text' name='task_ar[]' value="${resumeDetailList.task }">&nbsp;&nbsp;&nbsp;
				<input type='button' value='경력사항 삭제' id='deleteResDetail' onclick="deleteResumeDetail(${resumeDetailList.car_code })"><p>
				<input type='hidden' name='car_code_ar[]' value="${resumeDetailList.car_code }"><p>
			</div>
		</c:forEach>
		<div id="resumeDetail"></div>
		<input type="button" value="+추가 생성" id="addResumeDetail"><br>
		
		<p>
		기타 링크<br>
		<textarea rows="10" cols="40" name="res_etc_link">${resumedetail.res_etc_link }</textarea><p>
		
		<input type="submit" value="작성완료">
	</form>
</c:if>
</body>
</html>