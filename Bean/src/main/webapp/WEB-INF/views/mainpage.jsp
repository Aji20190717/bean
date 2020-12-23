<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeanMain</title>

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
</style>


<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/MainPageCss.css" />
<link rel="script" href="resources/js/MainPageJQ.js" />
<link rel="script" href="resources/js/MainPageJs.js" />
</head>


<body>
	<div style = "height:20px; align-items:right;" class = "bg-dark">
		<div style = "">
		<a class = "loginbar" style = "font-size:.015rem; font-family : Consolas; color:white;">회원가입</a>
		<a class = "loginbar" style = "font-size:.015rem; color:white;">로그인</a>
		</div>
	</div>
	
	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container">
			<a class="navbar-brand" href="#">Bean</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">About
							Bean & Select Class <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">English
							Lounge</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Question
							Lounge</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Review
							Lounge</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('https://source.unsplash.com/RCAhiGJsUUE/1920x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3 class="display-4">First Slide</h3>
						<p class="lead">This is a description for the first slide.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1920x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3 class="display-4">Second Slide</h3>
						<p class="lead">This is a description for the second slide.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<c:choose>
		<c:when test="${empty login }">
			<input type="button" value="회원가입/로그인"
				onclick="location.href='loginform.do'" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when
					test="${login.member_type eq 'S' || login.member_type eq 'SN' || login.member_type eq 'SG' }">
					<span>수강생 <a href="myinfo.do?member_no=${member_no}">${login.member_name }님</a></span>
				</c:when>
				<c:when test="${login.member_type eq 'T' }">
					<span>강사 <a href="mypage.do?member_no=${member_no}">${login.member_name }님</a></span>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<button onclick="location.href=''">챗봇</button>
	<button onclick="location.href=''">관리자 채팅</button>
	<button onclick="location.href=''">일반 채팅</button>


</body>
</html>