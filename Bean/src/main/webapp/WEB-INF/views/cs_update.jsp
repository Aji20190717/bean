<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="resources/css/boardcss.css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<script src="resources/js/boardjq.js"></script>
<script src="resources/js/boardjq2.js"></script>
<script src="resources/js/boardjs.js"></script>
<body>

	<%@ include file="./header.jsp"%>
	<form action="csupdateres.do" method="post">
		<input type="hidden" name="csno" value="${dto.csno }" />
		<input type="hidden" name="reviewboard_name"
			value="${login.member_name }"> <input type="hidden"
			name="reviewboard_no" value="${dto.reviewboard_no }" />
		<div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">Update</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">
							<div class="name">작성자</div>
							<div class="value">
								<input readonly="readonly" class="input--style-6" type="text"
									value="${dto.csname }" name="csname" readonly = "readonly">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">cstitle</div>
							<div class="value">
								<input readonly="readonly" class="input--style-6" type="text"
									name="cstitle" value="${dto.cstitle }">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">cscontent</div>
							<div class="value">
								<div class="input-group">
									<textarea class="form-control" id="p_content"
										name="csconment">${dto.csconment }</textarea>
									<script type="text/javascript">
										CKEDITOR.replace('p_content', {
											height : 500
										});
									</script>
								</div>
							</div>
						</div>
					</div>
					<div class="cardboard-footer">
						<div>
							<input type="submit" value="수정" />
						</div>
						<div>
							<br /> <input type="button" value="취소"
								onclick="location.href='cslist.do'" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		CKEDITOR.replace('contents');
	</script>

</body>
</html>