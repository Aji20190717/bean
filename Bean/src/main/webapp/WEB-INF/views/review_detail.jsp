<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
		<div class="wrapper wrapper--w900">
			<div class="cardboard cardboard-6">
				<div class="cardboard-heading">
					<h2 class="title">Detail For Question</h2>
				</div>
				<div class="cardboard-body">
					<div class="formboard-row">
						<div class="name">Title</div>
						<div class="value">
							<input readonly="readonly" class="input--style-6" type="text"
								value="${dto.reviewboard_title}">
						</div>
					</div>
					<div class="formboard-row">
						<div class="name">Class Name</div>
						<div class="value">
							<input readonly="readonly" class="input--style-6" type="text"
								value="${dto.class_name}">
						</div>
					</div>
					<div class="formboard-row">
						<div class="name">Writer Name</div>
						<div class="value">
							<input readonly="readonly" class="input--style-6" type="text"
								value="${dto.reviewboard_name}">
						</div>
					</div>
					<div class="formboard-row">
						<div class="name">Score</div>
						<div class="value">
							<input readonly="readonly" class="input--style-6" type="text"
								value="${dto.reviewboard_star}">
						</div>
					</div>
					<div class="formboard-row">
						<div class="name">Content</div>
						<div class="value">
							<div class="input-group">
								<textarea class="form-control" id="p_content"
									name="quetionboard" readonly="readonly">${dto.reviewboard_content}</textarea>
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
					<c:choose>
						<c:when test="${login.member_no eq dto.member_no }">
							<div>
								<input type="button" value="수정"
									onclick="location.href='review_updateform.do?reviewboard_no=${dto.reviewboard_no}'" />
								<input type="button" value="삭제"
									onclick="location.href='review_delete.do?reviewboard_no=${dto.reviewboard_no}'" />
								<input type="button" value="목록"
									onclick="location.href='review_list.do'" />
							</div>
						</c:when>
						<c:when test="${login.member_type  eq 'A'}">
							<input type="button" value="수정"
								onclick="location.href='review_updateform.do?reviewboard_no=${dto.reviewboard_no}'" />
							<input type="button" value="삭제"
								onclick="location.href='review_delete.do?reviewboard_no=${dto.reviewboard_no}'" />
							<input type="button" value="목록"
								onclick="location.href='review_list.do'" />
						</c:when>
						<c:otherwise>
							<input type="button" value="목록"
								onclick="location.href='review_list.do'" />
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</div>
	</div>

	<script>
		CKEDITOR.replace('contents');
	</script>

</body>
</html>