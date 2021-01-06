<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="resources/css/boardcss.css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<script src="resources/js/boardjq.js"></script>
<script src="resources/js/boardjq2.js"></script>
<script src="resources/js/boardjs.js"></script>
</head>
<body>

	<%@ include file="./header.jsp"%>

	<form action="review_insertres.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no }">
		<input type="hidden" name="reviewboard_name"
			value="${login.member_name }">
		<div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">Upload Review</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">
							<div class="name">Title</div>
							<div class="value">
								<input class="input--style-6" type="text"
									name="reviewboard_title" required>
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">수강 강좌</div>
							<div class="value">
								<select name="class_name" class="custom-select">
									<c:forEach items="${classList}" var="dept">
									<option value="${dept.class_name }">${dept.class_name }</option>
									<input type = "hidden" name = "class_no" value = "${dept.class_no }"/>
									</c:forEach>
								</select>

							</div>
						</div>
						<div class="formboard-row">
							<div class="name">별점</div>
							<div class="value">
								<select name="reviewboard_star" class="custom-select">
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
								</select>

							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Content</div>
							<div class="value">
								<div class="input-group">
									<textarea class="form-control" id="p_content"
										name="reviewboard_content">${questionDto.questionboard_content }</textarea>
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
							<input type="submit" value="등록" />
						</div>
						<div>
							<br /> <input type="button" value="취소"
								onclick="location.href='review_list.do'" />
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