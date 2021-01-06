<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

.dropdown-menu {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	float: left;
	min-width: 11rem !important;
	margin: .125rem 0 0;
	font-size: 1rem;
	color: #212529;
	text-align: left;
	background-color: #fff;
	background-clip: padding-box;
	border-radius: .25rem;
	transition: transform .3s cubic-bezier(.4, 0, .2, 1), opacity .2s
		cubic-bezier(.4, 0, .2, 1);
}

.dropdown-menu.show {
	transition: transform .3s cubic-bezier(.4, 0, .2, 1), opacity .2s
		cubic-bezier(.4, 0, .2, 1);
}

.dropdown-menu .dropdown-item:focus, .dropdown-menu .dropdown-item:hover,
	.dropdown-menu a:active, .dropdown-menu a:focus, .dropdown-menu a:hover
	{
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, .14), 0 7px 10px -5px
		rgba(156, 39, 176, .4);
	background-color: #9c27b0;
	color: #FFF;
}

.show .dropdown-toggle:after {
	transform: rotate(180deg);
}

.dropdown-toggle:after {
	will-change: transform;
	transition: transform .15s linear;
}

.dropdown-menu .dropdown-item, .dropdown-menu li>a {
	position: relative;
	width: auto;
	display: flex;
	flex-flow: nowrap;
	align-items: center;
	color: #333;
	font-weight: 400;
	text-decoration: none;
	font-size: .8125rem;
	border-radius: .125rem;
	margin: 0 .3125rem;
	transition: all .15s linear;
	min-width: 7rem;
	padding: 0.625rem 1.25rem;
	min-height: 1rem !important;
	overflow: hidden;
	line-height: 1.428571;
	text-overflow: ellipsis;
	word-wrap: break-word;
}

.dropdown-menu.dropdown-with-icons .dropdown-item {
	padding: .75rem 1.25rem .75rem .75rem;
}

.dropdown-menu.dropdown-with-icons .dropdown-item .material-icons {
	vertical-align: middle;
	font-size: 24px;
	position: relative;
	margin-top: -4px;
	top: 1px;
	margin-right: 12px;
	opacity: .5;
}
</style>
</head>
<!--  
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
<link rel="stylesgeet"
	href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">


<body>

	<%@ include file="./header.jsp"%>
	<!--  <button onclick="payfunc()">결제하기</button>-->
</head>

<body class="profile-page">

	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('http://wallpapere.org/wp-content/uploads/2012/02/black-and-white-city-night.png');"></div>
	<div class="main main-raised">
		<div class="profile-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							<c:choose>
								<c:when test="${!empty trainerDto.member_imgname }">
									<div class="avatar">
										<img
											src="${pageContext.request.contextPath }/resources/storage/${trainerDto.member_imgname}"
											alt="Circle Image"
											class="img-raised rounded-circle img-fluid">
									</div>
								</c:when>
								<c:otherwise>
									<div class="avatar">
										<img src="resources/images/profile/profile.png"
											alt="Circle Image"
											class="img-raised rounded-circle img-fluid">
									</div>
								</c:otherwise>
							</c:choose>

							<div class="name">
								<h3 class="title">${classDto.class_name }
									<b>class</b>
								</h3>
								<h6>${trainerDto.member_name }
									<b>teacher</b>
								</h6>
								<button onclick="payfunc()" class="btn">join in class</button>
							</div>
						</div>
					</div>
				</div>
				<div class="description text-center">
					<p>${classDto.class_content }</p>
				</div>
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile-tabs">
							<ul class="nav nav-pills nav-pills-icons justify-content-center"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="#studio" role="tab" data-toggle="tab"> <i
										class="material-icons">camera</i> Studio
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#works"
									role="tab" data-toggle="tab"> <i class="material-icons">palette</i>
										Work
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#favorite"
									role="tab" data-toggle="tab"> <i class="material-icons">favorite</i>
										Favorite
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="tab-content tab-space">
					<div class="tab-pane active text-center gallery" id="studio">
						<div class="row">
							<div class="col-md-3 ml-auto">
								<img
									src="https://images.unsplash.com/photo-1524498250077-390f9e378fc0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=83079913579babb9d2c94a5941b2e69d&auto=format&fit=crop&w=751&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1528249227670-9ba48616014f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=66b8e7db17b83084f16fdeadfc93b95b&auto=format&fit=crop&w=357&q=80"
									class="rounded">
							</div>
							<div class="col-md-3 mr-auto">
								<img
									src="https://images.unsplash.com/photo-1521341057461-6eb5f40b07ab?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=72da2f550f8cbd0ec252ad6fb89c96b2&auto=format&fit=crop&w=334&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1506667527953-22eca67dd919?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6326214b7ce18d74dde5e88db4a12dd5&auto=format&fit=crop&w=750&q=80"
									class="rounded">
							</div>
						</div>
					</div>
					<div class="tab-pane text-center gallery" id="works">
						<div class="row">
							<div class="col-md-3 ml-auto">
								<img
									src="https://images.unsplash.com/photo-1524498250077-390f9e378fc0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=83079913579babb9d2c94a5941b2e69d&auto=format&fit=crop&w=751&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1506667527953-22eca67dd919?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6326214b7ce18d74dde5e88db4a12dd5&auto=format&fit=crop&w=750&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1505784045224-1247b2b29cf3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ec2bdc92a9687b6af5089b335691830e&auto=format&fit=crop&w=750&q=80"
									class="rounded">
							</div>
							<div class="col-md-3 mr-auto">
								<img
									src="https://images.unsplash.com/photo-1504346466600-714572c4b726?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6754ded479383b7e3144de310fa88277&auto=format&fit=crop&w=750&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1494028698538-2cd52a400b17?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=83bf0e71786922a80c420c17b664a1f5&auto=format&fit=crop&w=334&q=80"
									class="rounded">
							</div>
						</div>
					</div>
					<div class="tab-pane text-center gallery" id="favorite">
						<div class="row">
							<div class="col-md-3 ml-auto">
								<img
									src="https://images.unsplash.com/photo-1504346466600-714572c4b726?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6754ded479383b7e3144de310fa88277&auto=format&fit=crop&w=750&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1494028698538-2cd52a400b17?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=83bf0e71786922a80c420c17b664a1f5&auto=format&fit=crop&w=334&q=80"
									class="rounded">
							</div>
							<div class="col-md-3 mr-auto">
								<img
									src="https://images.unsplash.com/photo-1505784045224-1247b2b29cf3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ec2bdc92a9687b6af5089b335691830e&auto=format&fit=crop&w=750&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1524498250077-390f9e378fc0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=83079913579babb9d2c94a5941b2e69d&auto=format&fit=crop&w=751&q=80"
									class="rounded"> <img
									src="https://images.unsplash.com/photo-1506667527953-22eca67dd919?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6326214b7ce18d74dde5e88db4a12dd5&auto=format&fit=crop&w=750&q=80"
									class="rounded">
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>






	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			IMP.init("imp43617146");

		});

		function payfunc() {

			var remainData = new Object();
			var obj = ${json};
			var classObj = ${classJson};

			if (obj['value'] == "true") {

				var jsonData;
				IMP.request_pay({
					pg : 'inicis', // version 1.1.0부터 지원.
					pay_method : 'kakaoPay',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명:결제테스트',
					// TODO : 가격에 대한 부분 협의 필요
					amount : 34000,
					//buyer_email : 'iamport@siot.do',
					//buyer_tel : '010-1234-5678',
					//buyer_addr : '서울특별시 강남구 삼성동',
					//buyer_postcode : '123-456'
					buyer_name : obj["userName"]

				}, function(rsp) {
					if (rsp.success) {

						//필요한 값을 object 객체에 추가해 줄 것
						remainData.usernum = obj["usernum"]; //buyer 회원 번호

						jsonData = JSON.stringify(remainData);

						//Dto 에 포함되는 값은 object에 포함하지 않고 보낼 것
						$.ajax({
							url : "insertPaying.do",
							method : "POST",
							data : {

								// TODO : classDTO의 payment_price로 추가할 것

								"jsonData" : jsonData,
								"member_no" : obj["usernum"],
								"class_no" : classObj["class_no"],
								"payment_price" : 34000,
								"payment_method" : 'KaKaoPay',
								"payment_impuid" : rsp.imp_uid

							},
							dataType : "json",
							success : function(returnData) {

								if (returnData["check"]) {

									var msg = "결제에 성공했습니다";
									alert(msg);

								} else {

									var msg = '결제에 실패하였습니다.';
									msg += '결제가 취소되었습니다'

								}
							}
						})

					} else {

						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;

					}
					alert(msg);
				});
			} else {

				alert("로그인 해주세요");

				// TODO :redirect 처리

			}
		}
	</script>

</body>
</html>