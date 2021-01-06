<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	bord
	?member_no=${login.member_no
}

'
r
:
 
none
;

	
outline
:
 
none
 
!
important
;

	
margin-left
:
 
10px
;


}
.table-title .btn:hov ?member_no =${login .member_no
	
}

er, .table-title .btn:focus {
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

* {
	padding: 0;
	margin: 0;
}

body {
	font-family: Verdana, Geneva, sans-serif;
	background-color: #CCC;
	font-size: 12px;
}

.label-container {
	position: fixed;
	bottom: 48px;
	right: 105px;
	display: table;
	visibility: hidden;
}

.label-text {
	color: #FFF;
	background: rgba(51, 51, 51, 0.5);
	display: table-cell;
	vertical-align: middle;
	padding: 10px;
	border-radius: 3px;
}

.label-arrow {
	display: table-cell;
	vertical-align: middle;
	color: #333;
	opacity: 0.5;
}

.float {
	position: fixed;
	width: 60px;
	height: 60px;
	bottom: 40px;
	right: 40px;
	background-color: #06C;
	color: #FFF;
	border-radius: 50px;
	text-align: center;
	box-shadow: 2px 2px 3px #999;
}

.my-float {
	font-size: 24px;
	margin-top: 18px;
}

a.float+div.label-container {
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s, opacity 0.5s ease;
}

a.float:hover+div.label-container {
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

	}

	function studentAlarm() {

		alert('학생 계정만 글작성이 가능합니다');
	}
</script>
<body>

	<%@ include file="./header.jsp"%>

	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-5">
							<h2>
								<b>Class 관리 페이지</b>
							</h2>
						</div>
						<div class="col-sm-7">
							<a href="insertRes.do" class="btn btn-secondary"><i
								class="material-icons">&#xE147;</i> <span>Add New Class</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>class_name</th>
							<th>class_content</th>
							<th>class_now/class_max</th>
							<th>class start Date</th>
							<th>class fin Date</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty classList}">
								<tr>
									<th colspan="4">---- 진행중인 수업이 없습니다 -----</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${classList }" var="classDto">
									<tr>
										<td>${classDto.class_name}</td>
										<td>${classDto.class_content}</td>
										<td>${classDto.class_now }/ ${classDto.class_max }</td>
										<td><fmt:formatDate value="${classDto.class_startDate }"
												pattern="yyyy/MM/dd" /></td>
										<td><fmt:formatDate value="${classDto.class_endDate }"
												pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>