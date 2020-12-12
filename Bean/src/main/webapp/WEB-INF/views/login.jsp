<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<body>

	<form action="login.do">
		아이디 : <input type="text" name="member_id" />
		비밀번호 : <input type="text" name="member_pw" />
		<input type="submit" value="로그인" />
	</form>

	<div id="naver_id_login" style="display: none;"></div>
		<div onclick="document.getElementById('naver_id_login_anchor').click();">
			<button>네이버 로그인</button>
		</div>
		<script type="text/javascript">
		  	var naver_id_login = new naver_id_login("zjjj7_AqHxAv9Xan5omR", "http://localhost:8787/bean/navercallback.do");
		  	var state = naver_id_login.getUniqState();
		 	
		  	naver_id_login.setButton("green", 3, 45);
		  	naver_id_login.setDomain("http://localhost:8787/bean");
		  	naver_id_login.setState(state);
		  	//naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
		</script>

	<input type="button" value="회원가입"
		onclick="location.href='registtype.do'" />

</body>
</html>