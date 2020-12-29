<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
body {
	letter-spacing: 0.7px;
	background-color: #eee
}

.container_select {
	margin-top: 100px;
	margin-bottom: 100px
}

p {
	font-size: 14px
}

.btn-primary {
	background-color: #42A5F5 !important;
	border-color: #42A5F5 !important
}

.cursor-pointer {
	cursor: pointer;
	color: #42A5F5
}

.pic {
	margin-top: 30px;
	margin-bottom: 20px
}

.card-block {
	width: 200px;
	border: 1px solid lightgrey;
	border-radius: 5px !important;
	background-color: #FAFAFA;
	margin-bottom: 30px
}

.card-body.show {
	display: block
}

.card {
	padding-bottom: 20px;
	box-shadow: 2px 2px 6px 0px rgb(200, 167, 216)
}

.radio {
	display: inline-block;
	border-radius: 0;
	box-sizing: border-box;
	cursor: pointer;
	color: #000;
	font-weight: 500;
	-webkit-filter: grayscale(100%);
	-moz-filter: grayscale(100%);
	-o-filter: grayscale(100%);
	-ms-filter: grayscale(100%);
	filter: grayscale(100%)
}

.radio:hover {
	box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.1)
}

.radio.selected {
	box-shadow: 0px 8px 16px 0px #EEEEEE;
	-webkit-filter: grayscale(0%);
	-moz-filter: grayscale(0%);
	-o-filter: grayscale(0%);
	-ms-filter: grayscale(0%);
	filter: grayscale(0%)
}

.selected {
	background-color: #E0F2F1
}

.a {
	justify-content: center !important
}

.btn_regist_select {
	border-radius: 0px
}

.btn_regist_select, .btn_regist_select:focus, .btn_regist_select:active
	{
	outline: none !important;
	box-shadow: none !important
}

</style>
<link rel="stylesheet" href="resources/css/regist_select.css" />
<link rel="script" href="resources/js/regist_select_bundle.js" />
<link rel="script" href="resources/js/regist_select_jquery.js" />
<body>

	<%@ include file="./header.jsp"%>

	<div class="container_select">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div
					class="card text-center justify-content-center shaodw-lg card-1 border-0 bg-white px-sm-2">
					<div class="card-body show ">
						<div class="row">
							<div class="col">
								<h5>
									<b>Next up</b>
								</h5>
							</div>
						</div>
						<div
							class="radio-group row justify-content-between px-3 text-center a">
							<div
								class="col-auto mr-sm-2 mx-1 card-block py-0 text-center radio ">
								<div class="flex-row">
									<div class="col">
										<div class="pic">
											<!-- 이미지 바꾸기 -->
											<img class="irc_mut img-fluid"
												src="https://i.imgur.com/6r0XCez.png" width="100"
												height="100"
												onclick = "location.href='registform.do?type=S'"
												>
										</div>
										<p>Student Register</p>
									</div>
								</div>
							</div>
							<div
								class="col-auto ml-sm-2 mx-1 card-block py-0 text-center radio ">
								<div class="flex-row">
									<div class="col">
										<div class="pic">
											<!-- 이미지 바꾸기 -->
											<img class="irc_mut img-fluid"
												src="https://i.imgur.com/bGCqROr.png" width="100"
												height="100"
												onclick = "location.href='registform.do?type=T'">
										</div>
										<p>Teacher Register</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col">
								<p class="text-muted">어떤 유형으로 계정으로 가입할 것인지 선택해주세요</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('.radio-group .radio').click(function() {
				$('.selected .fa').removeClass('fa-check');
				$('.radio').removeClass('selected');
				$(this).addClass('selected');
			});
		});
	</script>


</body>
</html>