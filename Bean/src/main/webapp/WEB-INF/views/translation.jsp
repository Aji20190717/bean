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



<body>

	<%@ include file="./header.jsp"%>
	<form action="transres.do" method="post">
		<input type="hidden" value="${questionDto.questionboard_no}"
			name="questionboard_no" />
		<div class="page-wrapper bg-gra-01 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">TransLator</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">

							<div class="name">Before</div>
							<div class="value">
								<select name="source" class="input--style-6" size="1">
									<option value="ko">한국어</option>
									<option value="en" selected="selected">영어</option>
								</select>
								<textarea class="textarea--style-6" name="text"
									id="replyTextArea" required>${text }</textarea>

							</div>

						</div>

						<div class="formboard-row">

							<div class="name">After</div>
							<div class="value">
								<select name="target" class="input--style-6" size="1">
									<option value="en">영어</option>
									<option value="ko" selected="selected">한국어</option>
								</select>
								<textarea class="textarea--style-6" name="message"
									id="replyTextArea" readonly="readonly">${result }</textarea>

							</div>

						</div>
						<div class="formboard-row">
							<div class = "value">
								<input type="submit" value="번역" />
							</div>
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