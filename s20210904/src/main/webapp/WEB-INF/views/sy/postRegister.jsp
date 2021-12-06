<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
</head>
<body>
	<table>
			<thead>
				<h1>작성</h1>
			</thead>
			<tbody>
				<form id="form_test" action="insertPost.do" method="post" encType="multiplart/form-data">
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요"
							name="postTitle" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea placeholder="내용을 입력하세요" name="postContent"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="btn_reg" type="button" class="btn_reg">등록</button>
							<button id="btn_pre" type="button" class="btn_pre">이전</button>
					</tr>
				</form>
			</tbody>
	</table>
</body>
<script type="text/javascript">
	$(document).on('click', '#btn_reg', function(e) {
		$("#form_post").submit();
	});

	//이전 클릭 시 testList로 이동
	$("#btn_pre").click(function javascript_onclikc() {
		$(location).attr('href', 'postList.do');
	});
</script>
</html>