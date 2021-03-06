<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="stylesheet" href="resources/css/boardcss.css" />

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #299be4;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.settings {
	color: #2196F3;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {

	float:right;
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

*{padding:0;margin:0;}

body{
	font-family:Verdana, Geneva, sans-serif;
	background-color:#CCC;
	font-size:12px;
}

.label-container{
	position:fixed;
	bottom:48px;
	right:105px;
	display:table;
	visibility: hidden;
}

.label-text{
	color:#FFF;
	background:rgba(51,51,51,0.5);
	display:table-cell;
	vertical-align:middle;
	padding:10px;
	border-radius:3px;
}

.label-arrow{
	display:table-cell;
	vertical-align:middle;
	color:#333;
	opacity:0.5;
}

.float{
	position:fixed;
	width:60px;
	height:60px;
	bottom:40px;
	right:40px;
	background-color:#06C;
	color:#FFF;
	border-radius:50px;
	text-align:center;
	box-shadow: 2px 2px 3px #999;
}

.my-float{
	font-size:24px;
	margin-top:18px;
}

a.float + div.label-container {
  visibility: hidden;
  opacity: 0;
  transition: visibility 0s, opacity 0.5s ease;
}

a.float:hover + div.label-container{
  visibility: visible;
  opacity: 1;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});

	function loginAlarm() {

		alert('로그인 해주세요');
		window.location.href = 'loginform.do';


	}

	function studentAlarm() {

		alert('학생 계정만 글작성이 가능합니다');
	}
</script>

</head>
<body class = "bg-gra-01">

	<%@ include file="./header.jsp"%>

	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-5">
							<h2>
								<b>Question Board</b>
							</h2>
						</div>
						<div class="col-sm-7">
							<c:choose>
								<c:when test="${empty login }">
									<button onclick="loginAlarm()" class="btn btn-secondary">
										<i class="material-icons">&#xE147;</i> <span>Add New
											Question</span>
									</button>
								</c:when>
								<c:when test="${login.member_type eq 'T' }">
									<button onclick="studentAlarm()" class="btn btn-secondary">
										<i class="material-icons">&#xE147;</i> <span>Add New
											Question</span>
									</button>
								</c:when>
								<c:otherwise>
									<a href="questionUpload.do" class="btn btn-secondary"><i
										class="material-icons">&#xE147;</i> <span>Add New
											Question</span></a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>title</th>
							<th>Date Created</th>
							<th>Name</th>
							<th>Reply</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty questionlist}">
								<tr>
									<th colspan="4">--작성된 글이 없습니다----</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${questionlist }" var="questiondto">
									<tr>
										<td>${questiondto.questionboard_no }</td>
										<td>${questiondto.questionboard_title}</td>
										<td><fmt:formatDate
												value="${questiondto.questionboard_date }"
												pattern="yyyy/MM/dd" /></td>
										<td>${questiondto.questionboard_name }</td>

										<!-- 답변이 되지 않았을 경우 빈칸 -->
										<c:choose>
											<c:when test="${empty questiondto.questionboard_reply }">
												<td>대기중</td>
											</c:when>
											<c:otherwise>
												<td>답변 완료</td>
											</c:otherwise>
										</c:choose>
										<!-- detail logo 바꾸기 -->
										<td><a
											href="questionDetail.do?questionboard_no=${questiondto.questionboard_no }"
											class="settings" title="detail" data-toggle="tooltip"><i
												class="material-icons">&#xE8B8;</i></a> <!-- 본인이 쓴 글이거나 Admin 계정일 경우 삭제 가능 -->
											<c:if test="${login.member_no eq questiondto.member_no }">
												<a href="" class="delete" title="Delete"
													data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
											</c:if></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="clearfix">
				
					<div class="hint-text">
						Showing <b>5</b> out of <b>${questionCount}</b> entries
					</div>
					<ul class="pagination">
						<c:if test="${paging.startPage != 1 }">
							<li class="page-item disabled"><a
								href="/bean/questionList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item active"><a class="page-link"
										href="/bean/questionList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a
										href="/bean/questionList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item"><a
								href="/bean/questionList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<a href="trans.do" class="float"> <i class="fa fa-language my-float"></i>
	</a>
	<div class="label-container">
		<div class="label-text">Translator</div>
		<i class="fa fa-play label-arrow"></i>
	</div>

</body>

</body>
</html>