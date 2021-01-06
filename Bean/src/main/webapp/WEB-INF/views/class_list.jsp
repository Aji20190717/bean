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

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>

<link rel="stylesheet" href="resources/css/boardcss.css" />

</head>
<body class = "bg-gra-01">
	<%@ include file="./header.jsp"%>

	<div class="container ">
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
											<c:choose>
												<c:when test="${!empty trainerDto.member_imgname }">
													<div class="image-link">
														<img class="image"
															src="${pageContext.request.contextPath }/resources/storage/${trainerDto.member_imgname}">
													</div>
												</c:when>
												<c:otherwise>
													<div class="image-link">
														<img class="image"
															src="resources/images/profile/profile.png">
													</div>
												</c:otherwise>
											</c:choose>

											<div class="search-result-item-body">
												<div class="row">
													<div class="col-sm-9">
														<h4 class="search-result-item-heading">
															<b>${classDto.class_name } class</b>
														</h4>
														<p class="info">${trainerDto.member_name }강사</p>
														<!-- TODO :  class 수업 부분을 DB에 추가하기 -->
														<p class="description">
															<b>수업 소개 : 
																${classDto.class_content }
															</b>														</p>

													</div>
													<div class="col-sm-3 text-align-center">
														<!-- TODO : 수강료 DB 추가 -->
														<p class="value3 mt-sm">수강료</p>
														<p class="fs-mini text-muted">
															시작일 :
															<fmt:formatDate value="${classDto.class_startDate }"
																pattern="yyyy/MM/dd" />
															<br /> 종강일 :
															<fmt:formatDate value="${classDto.class_endDate }"
																pattern="yyyy/MM/dd" />
														</p>
														<a class="btn btn-primary btn-info btn-sm"
															href="selectOneClass.do?class_no=${classDto.class_no }">수강하기</a>
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

				<div class="clearfix">
					<div class="hint-text">
						Showing <b>5</b> out of <b>${classCount}</b> entries
					</div>
					<ul class="pagination">
						<c:if test="${paging.startPage != 1 }">
							<li class="page-item disabled"><a
								href="/bean/classList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item active"><a class="page-link"
										href="/bean/classList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a
										href="/bean/classList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item"><a
								href="/bean/classList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>