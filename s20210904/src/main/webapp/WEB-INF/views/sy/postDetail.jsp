<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세</title>
</head>
<body>
	<table>
			<thead>
				<h1>상세</h1>
			</thead>
			<tbody>
				<form action="postUpdate.do" id="viewForm" method="post" encType="multiplart/form-data">
				<tr>
					<th>글번호:</th>
					<td><input name="userId" type="text" value="${result.user_id}"
						class="form-control" readonly /></td>

				</tr>
				<tr>
					<th>제목:</th>
					<td><input type="text" value="${result.post_title}"
						name="postTitle" class="form-control" /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="postContent" class="form-control">${result.post_ctx}</textarea></td>

				</tr>
				<tr>
					<td colspan="2">
						<button id="btn_pre" type="button" class="btn_pre">이전</button>
						<button id="btn_del" type="button" class="btn_pre">삭제</button>
						<button id="btn_adj" type="button" class="btn_reg">수정</button>
				</tr>
				</form>
			</tbody>
		</table>
</body>
<script type="text/javascript">
	$(document).on('click', '#btn_adj', function(e) {
		if(confirm("정말 수정하시겠습니까 ?") == true){
	        $("#viewForm").submit();
	    }
	    else{
	        return ;
	    }
	});
	$(document).on('click', '#btn_del', function(e) {
		if(confirm("정말 삭제하시겠습니까 ?") == true){
			$("#viewForm").attr("action", "deletePost.do");
			$("#viewForm").submit();
	    }
	    else{
	        return ;
	    }
	});

	//이전 클릭 시 testList로 이동
	$("#btn_pre").click(function javascript_onclick() {
		$(location).attr('href', 'postList.do');

	});
</script>
</html>