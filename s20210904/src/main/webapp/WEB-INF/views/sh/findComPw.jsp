<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업비밀번호찾기</title>
<link rel="stylesheet" href="css/sh/findPw.css" type="text/css">
</head>
<script type="text/javascript">
	function emaiㅣ_chk2() {
		alert("성공적으로 전송되었습니다. 이메일을 확인해주세요.")
	}

</script>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="container">
	   <div class="main">
        <h2>기업 비밀번호 찾기</h2>
        	<form action="findComPwForm" onsubmit="return emaiㅣ_chk2()">
           		 <div>
		                <input type="text" name="" id="com_name"   required>
		                <label for="com_name">회사명</label>
            	  </div>

            		<div>
		                <input type="text" name="" id="com_user"  required>
		                <label for="com_user">가입자명</label>
            		</div>

            		<div>
		                <input type="text" name="" id="com_id"  required>
		                <label for="com_id">아이디</label>
           		    </div>
            
            		<div>
		                <input type="text" name="" id="com_regnum"  required>
		                <label for="com_regnum">사업자등록번호</label>
            		</div>
            
            		<div>
		                <input type="text" name="" id="com_email"  required>
		                <label for="com_email">이메일</label>
           		    </div>
            
            	<input type="submit" name="" value="비밀번호 찾기">
        	</form>
      </div>
    </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>	
</body>
</html>