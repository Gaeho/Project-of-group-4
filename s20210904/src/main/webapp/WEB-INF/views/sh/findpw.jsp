<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 비밀번호 찾기</title>
<link rel="stylesheet" href="css/sh/findPw.css" type="text/css">
</head>
<script type="text/javascript">
	function emaiㅣ_chk() {
		alert("성공적으로 전송되었습니다. 이메일을 확인해주세요.")
	}

</script>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
    <div class="container">
      <div class="main">
        <h2>개인비밀번호 찾기</h2>
        <form action="findPwForm" onsubmit="return emaiㅣ_chk()">
        
            <div>
                <input type="text" name="" id="user_name"  required>
                <label for="user_name">이름</label>
            </div>

            <div>
                <input type="text" name="" id="user_id" required>
                <label for="user_id">아이디</label>
            </div>

            <div>
                <input type="email" name="" id="user_email" required>
                <label for="user_email">이메일</label>
            </div>
            
            <input type="submit"  value="비밀번호 찾기">
        </form>
        </div>
        </div>
	
		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>