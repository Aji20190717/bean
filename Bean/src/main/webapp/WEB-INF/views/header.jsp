<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.power.bean.dto.LoginDto"%>


<%
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
.carousel-item {
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.navbar-write {
	margin: 5px;
	font-size: x-small;
	color: white;
	text-decoration: none;
	text-align: left;
}

.navbar-write:visited {
	color: white;
	text-decoration: none;
}

.navbar-write:hover {
	color: white;
	text-decoration: none;
}
</style>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/MainPageCss.css" />
<link rel="script" href="resources/js/MainPageJQ.js" />
<link rel="script" href="resources/js/MainPageJs.js" />
</head>
<body>

	<%
		LoginDto login = (LoginDto) session.getAttribute("login");
	%>
	
	<!-- TODO : review, english lounge 연결 -->
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container">
			<a class="navbar-brand" href="main.do">Bean</a>
			<div class="loginbar"
				style="margin-left: auto; margin-right: 20px; display: inline-block;">
				<a class="login navbar-write" href="">About Bean</a>
				<c:choose>
					<c:when test="${empty login }">
						<a class="login navbar-write" href="">Sign Up</a>
						<a class="login navbar-write" href="loginform.do">Sign In</a>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${login.member_type eq 'S' || login.member_type eq 'SN' || login.member_type eq 'SG' }">
								<a class="navbar-write" href="myinfo.do?member_no">${login.member_name }님
									마이페이지</a>

							</c:when>
							<c:when test="${login.member_type eq 'T' }">
								<span>강사 <a class="navbar-write" href="mypage.do">${login.member_name }님
										마이페이지</a></span>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>


				<a class="signup navbar-write" href="">CS Center</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="classList.do"> Select Class <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">English
							Lounge</a></li>
					<li class="nav-item"><a class="nav-link"
						href="questionList.do">Question Lounge</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Review
							Lounge</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>