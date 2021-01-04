<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin-top: 20px;
	background-color: #eee;
}

.search-result-categories>li>a {
	color: #b6b6b6;
	font-weight: 400
}

.search-result-categories>li>a:hover {
	background-color: #ddd;
	color: #555
}

.search-result-categories>li>a>.glyphicon {
	margin-right: 5px
}

.search-result-categories>li>a>.badge {
	float: right
}

.search-results-count {
	margin-top: 10px
}

.search-result-item {
	padding: 20px;
	background-color: #fff;
	border-radius: 4px
}

.search-result-item:after, .search-result-item:before {
	content: " ";
	display: table
}

.search-result-item:after {
	clear: both
}

.search-result-item .image-link {
	display: block;
	overflow: hidden;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px
}

@media ( min-width :768px) {
	.search-result-item .image-link {
		display: inline-block;
		margin: -20px 0 -20px -20px;
		float: left;
		width: 200px
	}
}

@media ( max-width :767px) {
	.search-result-item .image-link {
		max-height: 200px
	}
}

.search-result-item .image {
	max-width: 100%
}

.search-result-item .info {
	margin-top: 2px;
	font-size: 12px;
	color: #999
}

.search-result-item .description {
	font-size: 13px
}

.search-result-item+.search-result-item {
	margin-top: 20px
}

@media ( min-width :768px) {
	.search-result-item-body {
		margin-left: 200px
	}
}

.search-result-item-heading {
	font-weight: 400
}

.search-result-item-heading>a {
	color: #555
}

@media ( min-width :768px) {
	.search-result-item-heading {
		margin: 0
	}
}
</style>

</head>
<body>
	<%@ include file="./header.jsp"%>

	<div class="container">
		<div class="row ng-scope">
			<div class="col-md-9 col-md-pull-3">
				<p class="search-results-count"></p>
				<c:choose>
					<c:when test="${empty classList }">
						<div>-----진행중인 수업이 없습니다-------</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${classList }" var="classDto">
							<c:forEach items="${trainerList }" var="trainerDto">
								<c:choose>
									<c:when test="${classDto.member_no eq trainerDto.member_no}">
										<section class="search-result-item">
											<div class="image-link"><img class="image"
												src="resources/images/profile/profile.png">
											</div>
											<div class="search-result-item-body">
												<div class="row">
													<div class="col-sm-9">
														<h4 class="search-result-item-heading">
															<b>${classDto.class_name } class</b>
														</h4>
														<p class="info">${trainerDto.member_name } 강사</p>
														<!-- TODO :  class 수업 부분을 DB에 추가하기 -->
														   <p class="description"><b>수업 소개 : </b>Not just usual Metro. But something bigger. Not just usual widgets, but real widgets. Not just yet another admin template, but nex</p>
														
													</div>
													<div class="col-sm-3 text-align-center">
													<!-- TODO : 수강료 DB 추가 -->
														<p class="value3 mt-sm">수강료</p>
														<p class="fs-mini text-muted">
															시작일 : <fmt:formatDate value="${classDto.class_startDate }" pattern = "yyyy/MM/dd"/>
															<br/>
															종강일 : <fmt:formatDate value="${classDto.class_endDate }" pattern = "yyyy/MM/dd"/>
															
														</p>
														<a class="btn btn-primary btn-info btn-sm" href="selectOneClass.do?class_no=${classDto.class_no }">수강하기</a>
													</div>
												</div>
											</div>
										</section>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<div class="text-align-center">
					<ul class="pagination pagination-sm">
						<li class="disabled"><a href="#">Prev</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>