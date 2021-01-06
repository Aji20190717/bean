<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#ocrSwitch {
	display: none;
}

label {
	display: inline-block;
	width: 17px;
	height: 8px;
	cursor: pointer;
	position: relative;
	background-color: #ccc;
}

label::before {
	content: '';
	display: block;
	width: 5px;
	height: 7px;
	left: 1px;
	position: absolute;
	background-color: #fff;
	transition: all .4s ease;
}

#ocrSwitch:checked+label {
	background-color: #2196F3
}

#ocrSwitch:checked+label:before {
	transform: translateX(11px);
}

label.round {
	border-radius: 100px;
}

label.round::before {
	border-radius: 50%;
}
</style>

</head>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="resources/css/boardcss.css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<script src="resources/js/boardjq.js"></script>
<script src="resources/js/boardjq2.js"></script>
<script src="resources/js/boardjs.js"></script>
<script>
	$(document).ready(function() {

		var obj = ${ocrjson};
		
		$("#ocrSwitch").change(function() {
			if ($("#ocrSwitch").is(":checked")) {

				$("#replyTextArea").val(obj['ocrText']);

			} else {

				$("#replyTextArea").val('');

			}
		});
	});
</script>


<body>

	<%@ include file="./header.jsp"%>
	<form action="questionReplyRes.do" method="post">
		<input type="hidden" value="${questionDto.questionboard_no}"
			name="questionboard_no" />
		<div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">Reply Question</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">
							<div class="name">Title</div>
							<div class="value">
								<input readonly="readonly" class="input--style-6" type="text"
									value="${questionDto.questionboard_title}">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Writer</div>
							<div class="value">
								<input readonly="readonly" class="input--style-6" type="text"
									value="${questionDto.questionboard_name}">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Content</div>
							<div class="value">
								<div class="input-group">
									<textarea class="form-control" id="p_content"
										name="questionboard_content" readonly="readonly">${questionDto.questionboard_content }</textarea>
									<script type="text/javascript">
										CKEDITOR.replace('p_content', {
											height : 500
										});
									</script>
								</div>
							</div>
						</div>

						<div class="formboard-row">
							<!-- 사진이 첨부됐을 경우, toggle을 통해 내용을 textarea에 넣을 수 있도록 함 -->

							<c:choose>
								<c:when test="${empty questionDto.questionboard_ocr}">
									<div class="name">Reply</div>
								</c:when>
								<c:otherwise>
									<div class="name">
										Reply <input type="checkbox" id="ocrSwitch"> <label
											for="ocrSwitch"></label>
									</div>
								</c:otherwise>
							</c:choose>

							<div class="value">
								<div class="input-group">
									<textarea class="textarea--style-6" name="message"
										id="replyTextArea">${questionDto.questionboard_reply}</textarea>
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
								onclick="location.href='questionList.do'" />
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