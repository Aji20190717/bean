<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html * {
	-webkit-font-smoothing: antialiased;
}

.h6, h6 {
	font-size: .75rem !important;
	font-weight: 500;
	font-family: Roboto, Helvetica, Arial, sans-serif;
	line-height: 1.5em;
	text-transform: uppercase;
}

.name h6 {
	margin-top: 10px;
	margin-bottom: 10px;
}

a .material-icons {
	vertical-align: middle;
}

.profile-page .page-header {
	height: 380px;
	background-position: center;
}

.header-filter:after, .header-filter:before {
	z-index: 1;
	width: 100%;
	height: 100%;
	display: block;
	content: "";
}

.header-filter::before {
	background: rgba(0, 0, 0, .5);
}

.main-raised {
	margin: -60px 30px 0;
	border-radius: 6px;
	box-shadow: 0 16px 24px 2px rgba(0, 0, 0, .14), 0 6px 30px 5px
		rgba(0, 0, 0, .12), 0 8px 10px -5px rgba(0, 0, 0, .2);
}

.main {
	background: #FFF;
	position: relative;
	z-index: 3;
}

.profile-page .profile {
	text-align: center;
}

.profile-page .profile img {
	max-width: 160px;
	width: 100%;
	margin: 0 auto;
	-webkit-transform: translate3d(0, -50%, 0);
	-moz-transform: translate3d(0, -50%, 0);
	-o-transform: translate3d(0, -50%, 0);
	-ms-transform: translate3d(0, -50%, 0);
	transform: translate3d(0, -50%, 0);
}

.img-raised {
	box-shadow: 0 5px 15px -8px rgba(0, 0, 0, .24), 0 8px 10px -5px
		rgba(0, 0, 0, .2);
}

.rounded-circle {
	border-radius: 50% !important;
}

.img-fluid, .img-thumbnail {
	max-width: 100%;
	height: auto;
}

.title {
	margin-top: 30px;
	margin-bottom: 25px;
	min-height: 32px;
	color: #3C4858;
	font-weight: 700;
	font-family: "Roboto Slab", "Times New Roman", serif;
}

.profile-page .description {
	margin: 1.071rem auto 0;
	max-width: 600px;
	color: #999;
	font-weight: 300;
}

p {
	font-size: 14px;
	margin: 0 0 10px;
}

.profile-page .profile-tabs {
	margin-top: 4.284rem;
}

.tab-space {
	padding: 20px 0 50px;
}

.profile-page .gallery {
	margin-top: 3.213rem;
	padding-bottom: 50px;
}

.profile-page .gallery img {
	width: 100%;
	margin-bottom: 2.142rem;
}

.profile-page .profile .name {
	margin-top: -80px;
}

img.rounded {
	border-radius: 6px !important;
}

/*buttons*/
.btn {
	position: relative;
	padding: 12px 30px;
	margin: .3125rem 1px;
	font-size: .75rem;
	font-weight: 400;
	line-height: 1.428571;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 0;
	border: 0;
	border-radius: .2rem;
	outline: 0;
	transition: box-shadow .2s cubic-bezier(.4, 0, 1, 1), background-color
		.2s cubic-bezier(.4, 0, .2, 1);
	will-change: box-shadow, transform;
}

.btn.btn-just-icon {
	font-size: 20px;
	height: 41px;
	min-width: 41px;
	width: 41px;
	padding: 0;
	overflow: hidden;
	position: relative;
	line-height: 41px;
}

.btn.btn-just-icon fa {
	margin-top: 0;
	position: absolute;
	width: 100%;
	transform: none;
	left: 0;
	top: 0;
	height: 100%;
	line-height: 41px;
	font-size: 20px;
}

.btn.btn-link {
	background-color: transparent;
	color: #999;
}

.justify-content-center {
	text-align: center;
}

.emptyspace {
	padding-bottom: 50px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : "profileimg.do",
		contentType : "application/json",
		dataType : "json",
		success : function(msg){
			console.log(msg);
			if(msg.check == true){
				$("#profileimg").attr("src","${pageContext.request.contextPath }/resources/storage/${login.member_imgname}");
			} else {
				$("#profileimg").attr("src","resources/images/profile/profile.png");
			}
		}, error : function(){
			alert("통실 실패");
		}
	});

});
</script>

</head>
<body class="profile-page">

	<%@ include file="./header.jsp"%>

	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('http://wallpapere.org/wp-content/uploads/2012/02/black-and-white-city-night.png');"></div>
	<div class="main main-raised">
		<div class="profile-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							<div class="avatar">
								<img id="profileimg"
									alt="Circle Image"
									class="img-raised rounded-circle img-fluid">
							</div>
							<div class="name">
								<br />
								<h6>${login.member_name }
									<b>User</b>
								</h6>
								<button onclick="location.href='myinfodetail.do'" class="btn">수강
									class</button>
								<button onclick="location.href='logout.do'" class="btn">로그아웃</button>
								<!-- 회원 탈퇴 처리 -->
								<button
									onclick=""
									class="btn">회원 탈퇴</button>
								<button
									onclick="location.href='myinfoupdateform.do'"
									class="btn">정보 수정</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row emptyspace">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile-tabs">
							<div class="justify-content-center">
								<div>
									<b>Email</b> ${login.member_email }
								</div>
								<div>
									<b>Phone</b>${login.member_phone }
									<div>
										<b>Address</b>${login.member_post }<span>${login.member_addr1 }</span><span>${login.member_addr2 }</span>
									</div>
									<div>
										<b>Birth</b>${login.member_birth}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
