<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="./header.jsp"%>
<h1>${login }</h1>
<h1>${login.member_no }</h1>
<table border = "1">
	
	<col width = "50">
	<col width = "100">
	<col width = "500">
	<col width = "100">

	
	<c:choose>
		<c:when test="${empty classList}">
			<tr>	
			<th colspan = "4">--작성된 글이 없습니다----</th>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${classList }" var ="classDto">
				<tr>
				
					<td>${classDto.class_no}</td>
					<td>${classDto.member_no}</td>
					<td>${classDto.class_max}</td>
					<td>${classDto.class_now}</td>
					<td>${classDto.class_startDate}</td>
					<td><a href="selectOneClass.do?class_no=${classDto.class_no }&member_no=${login.member_no}&member_name=${login.member_name}">${classDto.class_name}</a></td>
					<td>${classDto.class_memberName}</td>
					<td>${classDto.class_delflag}</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</body>
</html>