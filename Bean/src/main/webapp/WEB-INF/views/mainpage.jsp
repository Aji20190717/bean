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

#containerCal{
	
	width :810px;
	margin : 100px;
	margin-right:10px;

}

</style>


<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/MainPageCss.css" />
<link rel="script" href="resources/js/MainPageJQ.js" />
<link rel="script" href="resources/js/MainPageJs.js" />

<script src='webjars/moment/2.19.1/min/moment.min.js'></script>
<script src='webjars/fullcalendar/3.5.1/dist/fullcalendar.js'></script>
<script type="text/javascript">

//TODO : class 시작일, class 마감일을 달력에 표기할 것
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      events: {
    	  
      }
    });
  });
</script>
</head>

	<%@ include file="./header.jsp"%>
	
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
						<h3 class="display-4">English Lounge</h3>
						<p class="lead">자유롭게 영어로 토론해보세요!</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1920x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3 class="display-4">Question Lounge</h3>
						<p class="lead">자유롭게 영어로 글을 남겨보세요!</p>
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



	<!-- Page Content -->
	<div class="container">

		<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0"
			style="font-style: bold;">Teacher Gallery</h1>
		<h4 class="font-weight-light text-center text-lg-left mt-4 mb-0">함께할
			선생님을 만나보세요!</h4>
		<hr class="mt-2 mb-5">
		<!-- 최근 등록 강사 9명의 사진으로 바꿀 것 -->
		<div class="row text-center text-lg-left">

			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/EUfxH-pze7s/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/M185_qYH8vg/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/sesveuG_rNo/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/AvhMzHwiE_0/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/2gYsZUmockw/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/EMSDtjVHdQ8/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/8mUEy0ABdNE/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/G9Rfc1qccH4/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/aJeH0KcFkuc/400x300" alt="">
				</a>
			</div>
			<div class="col-lg-3 col-md-4 col-6">
				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail"
					src="https://source.unsplash.com/p2TQ-3Bh3Oo/400x300" alt="">
				</a>
			</div>
		</div>
	</div>
	
	<div id = "containerCal">
		<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0"
			style="font-style: bold;">수업 일정</h1>
		<h4 class="font-weight-light text-center text-lg-left mt-4 mb-0">
			진행될 수업 일정을 확인해보세요</h4>
		<hr class="mt-2 mb-5">
		
	<div id='calendar'></div>
</div>
</body>
</html>