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

	<form action="">
		아이디 : <input type="text" name="member_id" />
		비밀번호 : <input type="text" name="member_pw" />
	</form>

	<div id="naver_id_login" style="text-align:center">
		<a href="${url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
		</a>
	</div>

	<input type="button" value="회원가입"
		onclick="location.href='registtype.do'" />

</body>
</html>