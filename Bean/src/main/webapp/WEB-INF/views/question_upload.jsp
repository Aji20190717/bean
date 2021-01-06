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

	<form:form method="post" enctype="multipart/form-data"
		modelAttribute="QuestionDto" action="questionUploadres.do">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" name="questionboard_name"
			value="${login.member_name }" />
		<div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">Upload Question</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">
							<div class="name">Title</div>
							<div class="value">
								<input class="input--style-6" type="text"
									name="questionboard_title">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Question Type</div>
							<div class="value">
								<select class="selectpicker" name = "groupOption">
									<option>글쓰기 첨삭</option>
									<option>문제 첨삭</option>
									<option>수업 첨삭</option>
								</select>

							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Content</div>
							<div class="value">
								<div class="input-group">
									<textarea class="form-control" id="p_content"
										name="questionboard_content">${questionDto.questionboard_content }</textarea>
									<script type="text/javascript">
										CKEDITOR.replace('p_content', {
											height : 500
										});
									</script>
								</div>
								 <!-- 
								 <textarea rows="10" cols="60" name="questionboard_content"></textarea>
								  -->
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Upload Image</div>
							<div class="value">
								<div class="input-group js-input-file">
									<input class="input-file" type="file" name="question_mpfile"
										id="file">
									<label class="label--file" for="file">Choose
										file</label>
									<!-- TODO : 파일명이 뜨도록 변경하기
									 <span
										class="input-file__info">No file chosen</span>
										-->
								</div>
								<div class="label--desc">Upload your image File.</div>
							</div>
						</div>
					</div>
					<div class="cardboard-footer">
						<div>
							<input type="submit" value="제출" />
						</div>
						<div>
							<br /> <input type="button" value="취소"
								onclick="location.href='questionList.do'" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<script>
		CKEDITOR.replace('contents');
	</script>

</body>
</html>