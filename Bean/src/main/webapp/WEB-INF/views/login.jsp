<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<body>
	
	<!-- 일반로그인 -->
	<section>
		<form action="/bean/logininfo.do" method="post">
			<ul>
				<li>
					<label for="userID">ID</label>
					<input id="userID" type="text" name="member_id">
				</li>
				<li>
					<label for="password">Password</label>
					<input id="password" type="password" name="member_pw">
				</li>
				<li>
					<input type="submit" value="로그인"/>
				</li>
			</ul>
			<input type="text" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</section>


	<div id="naver_id_login" style="display: none;"></div>
	<div
		onclick="document.getElementById('naver_id_login_anchor').click();">
		<button>네이버 로그인</button>
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


	<a
		href="https://kauth.kakao.com/oauth/authorize?client_id=3350426d432820aada3df120c58988d4&redirect_uri=http://localhost:8787/bean/kakaologin.do&response_type=code">
		<img class=kakaoLogin alt="kakao" src="resources/img/kakao_login.png">
	</a>

	<input type="button" value="회원가입"
		onclick="location.href='registtype.do'" />
</body>


</html>