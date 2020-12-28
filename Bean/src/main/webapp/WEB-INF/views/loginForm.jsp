<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:choose>
		<c:when test="${ userId == null }">
			<form action="logincheck">
				<input tye="text" name="id"><br> <input tye="text"
					name="pwd"><br> <input type="submit" value="로그인">
				<a
					href="https://kauth.kakao.com/oauth/authorize?client_id=3350426d432820aada3df120c58988d4&redirect_uri=http://localhost:8787/bean/">
					<img width="180px" src="resources/images/kakao_btn.png">
				</a>
			</form>
		</c:when>
		<c:otherwise>
			${ userId }님 <a href="logout">로그아웃</a>하세요
		</c:otherwise>
	</c:choose>



</body>
</html>