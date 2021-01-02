<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- TODO : 글씨체 로딩, 헤더에 세션 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="resources/css/login_css.css" />
<link rel="stylesheet" href="resources/css/login_css2.css" />
<link rel="script" href="resources/js/login_jq.js" />
<link rel="script" href="resources/js/login_js1.js" />
<script src="webjars/font-awesome/5.8.2/webfonts/fa-brands-400.woff"></script>


<style type="text/css">
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}
body {
	background: #007bff;
	background: linear-gradient(to right, #0062E6, #33AEFF);
}
.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}
.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}
.card-signin .card-body {
	padding: 2rem;
}
.form-signin {
	width: 100%;
}
.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}
.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}
.form-label-group input {
	height: auto;
	border-radius: 2rem;
}
.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}
.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}
.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}
.form-label-group input:-ms-input-placeholder {
	color: transparent;
}
.form-label-group input::-ms-input-placeholder {
	color: transparent;
}
.form-label-group input::-moz-placeholder {
	color: transparent;
}
.form-label-group input::placeholder {
	color: transparent;
}
.form-label-group input:not(:placeholder-shown) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}
.form-label-group input:not(:placeholder-shown) ~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}
.btn-google {
	color: white;
	background-color: #ea4335;
}
.btn-facebook {
	color: white;
	background-color: #3b5998;
}
/* Fallback for Edge
-------------------------------------------------- */
@
supports (-ms-ime-align: auto) { .form-label-group >label { display:none;
	
}
.form-label-group input::-ms-input-placeholder {
	color: #777;
}
}
/* Fallback for IE
-------------------------------------------------- */
@media all and (-ms-high-contrast: none) , ( -ms-high-contrast : active)
	{
	.form-label-group>label {
		display: none;
	}
	.form-label-group input:-ms-input-placeholder {
		color: #777;
	}
}
</style>

<body>

	<%@ include file="./header.jsp"%>

	<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Sign In</h5>
						<form class="form-signin" action="/bean/logininfo.do" method="post">
							<div class="form-label-group">
								<input type="text" name="member_id" placeholder= "id"class="form-control"
									required autofocus> 
							</div>
							<div class="form-label-group">
								<input type="password" name="member_pw" placeholder= "password"  class="form-control"
									placeholder="Password" required>
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">Remember password</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Sign in</button>
						</form>
						<a onclick="location.href='registtype.do'">회원가입</a>
						<hr class="my-4">
						<button class="btn btn-lg btn-google btn-block text-uppercase"
							onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=3350426d432820aada3df120c58988d4&redirect_uri=http://localhost:8787/bean/kakaologin.do&response_type=code'">
							<i class="fab fa-google mr-2"></i> Sign in with KaKao
						</button>
						<button class="btn btn-lg btn-facebook btn-block text-uppercase"
							onclick="document.getElementById('naver_id_login_anchor').click();">
							<i class="fab fa-facebook-f mr-2"></i> Sign in with Naver
						</button>
						<div id="naver_id_login" style="display: none;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("zjjj7_AqHxAv9Xan5omR",
			"http://localhost:8787/bean/navercallback.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3, 45);
	naver_id_login.setDomain("http://localhost:8787/bean");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>


</body>
</html>